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
  UploadAudioBloc() : super(const UploadAudioInitial());

  @override
  Stream<UploadAudioState> mapEventToState(UploadAudioEvent event) async* {
    if (event is UploadAudio) {
      yield const UploadAudioInProgress();

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
          print(userRes.username);
          List<User> usersList = await Amplify.DataStore.query(
            User.classType,
            where: User.EMAIL.eq(userRes.username),
          );

          print(usersList);
          User user = usersList.first;
          print(user);

          Audio audio = Audio(
            uploadedOn: TemporalDateTime(DateTime.now().toLocal()),
            title: event.title,
            category: event.category,
            audioKey: audioResult.key,
            thumbnailKey: thumbnailResult.key,
            listenings: 0,
            creatorID: user.creator?.id,
          );

          if (user.creator?.id != null) {
            Creator oldCreator = (await Amplify.DataStore.query(
                Creator.classType,
                where: Creator.ID.eq(user.creator?.id)))[0];

            print("Old Creator:");
            print(oldCreator.audioUploads);
            List<Audio> newList = [];
            if (oldCreator.audioUploads == null) {
              print("1");
              newList.add(audio);
            } else {
              print("2");
              newList = oldCreator.audioUploads!;
              newList.add(audio);
            }
            print("NewList: $newList");
            Creator newCreator =
                oldCreator.copyWith(id: oldCreator.id, audioUploads: newList);
            print("New Creator");
            print(newCreator.audioUploads);

            try {
              await Amplify.DataStore.save(newCreator);
            } catch (error) {
              print(error);
            }

            try {
              await Amplify.DataStore.save(audio);
            } catch (error) {
              print(error);
            }
          }

          yield const UploadAudioSuccess();
        } on StorageException catch (error) {
          yield UploadAudioFailure(error: error.message);
        }
      } on StorageException catch (error) {
        yield UploadAudioFailure(error: error.message);
      }
    }
  }
}
