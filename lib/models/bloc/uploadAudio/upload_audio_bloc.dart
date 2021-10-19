import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../ModelProvider.dart';

part './upload_audio_event.dart';
part './upload_audio_state.dart';

class UploadAudioBloc extends Bloc<UploadAudioEvent, UploadAudioState> {
  UploadAudioBloc() : super(const UploadAudioInitial()) {
    on<UploadAudio>(_uploadAudio);
  }

  Future<void> _uploadAudio(
      UploadAudio event, Emitter<UploadAudioState> emit) async {
    emit(const UploadAudioInProgress());

    // Audio Upload
    final audioPlatformFile = event.audioResult.files.single;
    final audioPath = audioPlatformFile.path!;
    final audioKey = "audio/" + audioPlatformFile.name;
    final audioFile = File(audioPath);

    try {
      final UploadFileResult audioResult =
          await Amplify.Storage.uploadFile(local: audioFile, key: audioKey);

      // Thumbnail Upload
      final thumbnailKey = "thumbnail/" + DateTime.now().toString();
      final thumbnailFile = File(event.thumbnailResult!.path);
      try {
        final UploadFileResult thumbnailResult =
            await Amplify.Storage.uploadFile(
                local: thumbnailFile, key: thumbnailKey);

        // Datastore Upload
        AuthUser userRes = await Amplify.Auth.getCurrentUser();

        User user = (await Amplify.DataStore.query(
          User.classType,
          where: User.EMAIL.eq(userRes.username),
        ))[0];

        AudioCategory category = (await Amplify.DataStore.query(
          AudioCategory.classType,
          where: AudioCategory.TITLE.eq(event.category),
        ))[0];

        if (user.isCreator) {
          Audio audio = Audio(
            uploadedOn: TemporalDateTime(DateTime.now().toLocal()),
            title: event.title,
            description: event.description,
            category: category,
            audioKey: audioResult.key,
            thumbnailKey: thumbnailResult.key,
            listenings: 0,
            userID: user.id,
          );

          try {
            await Amplify.DataStore.save(audio);
          } catch (error) {
            print(error);
          }

          List<Audio> updatedAudioList = [];

          if (user.audioUploads == null) {
            updatedAudioList.add(audio);
          } else {
            updatedAudioList = user.audioUploads!;
            updatedAudioList.add(audio);
          }

          User userUpdated = user.copyWith(
            id: user.id,
            audioUploads: updatedAudioList,
          );

          try {
            await Amplify.DataStore.save(userUpdated);
          } catch (error) {
            print(error);
          }
        }
      } on StorageException catch (error) {
        emit(UploadAudioFailure(error: error.message));
      }
    } on StorageException catch (error) {
      emit(UploadAudioFailure(error: error.message));
    }
    emit(const UploadAudioSuccess());
  }
}
