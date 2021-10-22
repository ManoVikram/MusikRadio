import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../ModelProvider.dart';

part './fetch_audio_event.dart';
part './fetch_audio_state.dart';

class FetchAudioBloc extends Bloc<FetchAudioEvent, FetchAudioState> {
  FetchAudioBloc() : super(const FetchAudioInitial()) {
    on<FetchAllAudio>(_fetchAllAudio);
    on<FetchCategoryAudio>(_fetchCategoryAudio);
  }

  Future<void> _fetchAllAudio(
      FetchAllAudio event, Emitter<FetchAudioState> emit) async {
    emit(const FetchAudioInProgress());

    List<Audio> allAudio = await Amplify.DataStore.query(
      Audio.classType,
      sortBy: [Audio.UPLOADEDON.descending()],
    );

    List<Map<String, String>> contentUrl = [];
    List<String> channelNames = [];

    for (var i = 0; i < allAudio.length; i++) {
      try {
        final GetUrlResult audioUrlResult =
            await Amplify.Storage.getUrl(key: allAudio[i].audioKey);

        final GetUrlResult thumbnailUrlResult =
            await Amplify.Storage.getUrl(key: allAudio[i].thumbnailKey);

        User user = (await Amplify.DataStore.query(
          User.classType,
          where: User.ID.eq(allAudio[i].userID),
        ))[0];

        final GetUrlResult profilePictureResullt =
            await Amplify.Storage.getUrl(key: user.profilePictureKey!);

        contentUrl.add({
          "audioURL": audioUrlResult.url,
          "thumbnailURL": thumbnailUrlResult.url,
          "profilePictureURL": profilePictureResullt.url,
        });

        channelNames.add(user.name!);
      } on StorageException catch (error) {
        emit(FetchAudioFailure(error: error.message));
      }
    }

    AudioData audioData = AudioData(
      audio: allAudio,
      url: contentUrl,
      channelName: channelNames,
    );

    emit(FetchAudioSuccess(audioData: audioData));
  }

  Future<void> _fetchCategoryAudio(
      FetchCategoryAudio event, Emitter<FetchAudioState> emit) async {
    emit(const FetchAudioInProgress());

    List<Audio> categoryAudio = await Amplify.DataStore.query(
      Audio.classType,
      where: Audio.CATEGORY.eq(event.category.id),
      sortBy: [Audio.UPLOADEDON.descending()],
    );

    List<Map<String, String>> contentUrl = [];
    List<String> channelNames = [];

    for (var i = 0; i < categoryAudio.length; i++) {
      try {
        final GetUrlResult audioUrlResult =
            await Amplify.Storage.getUrl(key: categoryAudio[i].audioKey);

        final GetUrlResult thumbnailUrlResult =
            await Amplify.Storage.getUrl(key: categoryAudio[i].thumbnailKey);

        User user = (await Amplify.DataStore.query(
          User.classType,
          where: User.ID.eq(categoryAudio[i].userID),
        ))[0];

        if (user.profilePictureKey != null) {
          final GetUrlResult profilePictureResullt =
              await Amplify.Storage.getUrl(key: user.profilePictureKey!);

          contentUrl.add({
            "audioURL": audioUrlResult.url,
            "thumbnailURL": thumbnailUrlResult.url,
            "profilePictureURL": profilePictureResullt.url,
          });
        } else {
          contentUrl.add({
            "audioURL": audioUrlResult.url,
            "thumbnailURL": thumbnailUrlResult.url,
          });
        }

        channelNames.add(user.name!);
      } on StorageException catch (error) {
        emit(FetchAudioFailure(error: error.message));
      }
    }

    AudioData audioData = AudioData(
      audio: categoryAudio,
      url: contentUrl,
      channelName: channelNames,
    );

    emit(FetchAudioSuccess(audioData: audioData));
  }
}
