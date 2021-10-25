import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../ModelProvider.dart';

part './fetch_audio_thumbnail_url_event.dart';
part './fetch_audio_thumbnail_url_state.dart';

class FetchAudioThumbnailUrlBloc extends Bloc<FetchURLEvent, FetchURLState> {
  FetchAudioThumbnailUrlBloc() : super(const FetchURLInitial()) {
    on<FetchURLEvent>(_fetchAudioThumbnailUrl);
  }

  Future<void> _fetchAudioThumbnailUrl(
      FetchURLEvent event, Emitter<FetchURLState> emit) async {
    emit(const FetchURLInProgress());

    List<Map<String, String>> uploadedContentUrl = [];

    for (var i = 0;
        i < (event as FetchCurrentCreatorContentURL).uploadedAudio.length;
        i++) {
      try {
        final GetUrlResult audioUrlResult =
            await Amplify.Storage.getUrl(key: event.uploadedAudio[i].audioKey);

        final GetUrlResult thumbnailUrlResult = await Amplify.Storage.getUrl(
            key: event.uploadedAudio[i].thumbnailKey);

        uploadedContentUrl.add({
          "audioURL": audioUrlResult.url,
          "thumbnailURL": thumbnailUrlResult.url,
        });
      } on StorageException catch (error) {
        emit(FetchURLFailure(error: error.message));
      }
    }

    emit(FetchURLSuccess(uploadedContentUrl: uploadedContentUrl));
  }
}
