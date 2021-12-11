import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:equatable/equatable.dart';

import '../../ModelProvider.dart';

part './like_audio_event.dart';
part './like_audio_state.dart';

class LikeAudioBloc extends Bloc<LikeAudioEvent, LikeAudioState> {
  LikeAudioBloc() : super(const LikeAudioInitial()) {
    on<LikeAudioEvent>(_toggleLike);
  }

  Future<void> _toggleLike(
      LikeAudioEvent event, Emitter<LikeAudioState> emit) async {
    emit(const LikeAudioInProgress());

    Audio oldAudio = (await Amplify.DataStore.query(
      Audio.classType,
      where: Audio.ID.eq(
        (event as ToggleLike).audioID,
      ),
    ))[0];

    // Audio oldAudio = event.audio;

    AuthUser userRes = await Amplify.Auth.getCurrentUser();

    User user = (await Amplify.DataStore.query(
      User.classType,
      where: User.EMAIL.eq(userRes.username),
    ))[0];

    List<UserAudio> likedUsers = [];

    if (oldAudio.likes == null) {
      likedUsers.add(UserAudio(audio: oldAudio, user: user));
    } else {
      likedUsers = oldAudio.likes!;
      likedUsers.add(UserAudio(audio: oldAudio, user: user));
    }

    Audio newAudio = oldAudio.copyWith(id: oldAudio.id, likes: likedUsers);

    try {
      await Amplify.DataStore.save(newAudio);
    } catch (error) {
      print(error);
      emit(LikeAudioFailure(error: error));
    }

    List<UserAudio> likedAudio = [];

    if (user.liked == null) {
      likedAudio.add(UserAudio(audio: newAudio, user: user));
    } else {
      likedAudio = user.liked!;
      likedAudio.add(UserAudio(audio: newAudio, user: user));
    }

    User newUser = user.copyWith(id: user.id, liked: likedAudio);

    try {
      await Amplify.DataStore.save(newUser);
    } catch (error) {
      print(error);
      emit(LikeAudioFailure(error: error));
    }

    print("LIKED!!!");

    emit(const LikeAudioSuccess());
  }
}
