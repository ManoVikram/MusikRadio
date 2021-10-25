import 'dart:io';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amplify_flutter/amplify.dart';

import '../../ModelProvider.dart';

part './update_user_data_event.dart';
part './update_user_data_state.dart';

class UpdateUserDataBloc
    extends Bloc<UpdateUserDataEvent, UpdateUserDataState> {
  UpdateUserDataBloc() : super(const UpdateUserDataInitial()) {
    on<UpdateUserDataEvent>(_updateUserData);
  }

  Future<void> _updateUserData(
      UpdateUserDataEvent event, Emitter<UpdateUserDataState> emit) async {
    emit(const UpdateUserDataInProgress());

    User currentUserOld = (await Amplify.DataStore.query(
      User.classType,
      where: User.EMAIL.eq((event as UpdateUserData).email),
    ))[0];

    if (event.profilePicture != null) {
      final profilePictureKey =
          "profilePicture/" + DateTime.now().toLocal().toString();
      try {
        final UploadFileResult profilePictureResult =
            await Amplify.Storage.uploadFile(
          local: event.profilePicture!,
          key: profilePictureKey,
        );

        User currentUserNew = currentUserOld.copyWith(
          id: currentUserOld.id,
          name: event.name ?? currentUserOld.name,
          description: event.description ?? currentUserOld.description,
          profilePictureKey: profilePictureResult.key,
        );

        await Amplify.DataStore.save(currentUserNew);
      } on StorageException catch (error) {
        emit(UpdateUserDataError(error: error.message));
      }
    } else {
      User currentUserNew = currentUserOld.copyWith(
        id: currentUserOld.id,
        name: event.name ?? currentUserOld.name,
        description: event.description ?? currentUserOld.description,
      );

      await Amplify.DataStore.save(currentUserNew);
    }

    emit(const UpdateUserDataSuccess());
  }
}
