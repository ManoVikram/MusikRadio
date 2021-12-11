part of './like_audio_bloc.dart';

abstract class LikeAudioState extends Equatable {
  const LikeAudioState();

  @override
  List<Object> get props => [];
}

class LikeAudioInitial extends LikeAudioState {
  const LikeAudioInitial();

  @override
  List<Object> get props => [];
}

class LikeAudioInProgress extends LikeAudioState {
  const LikeAudioInProgress();

  @override
  List<Object> get props => [];
}

class LikeAudioSuccess extends LikeAudioState {
  const LikeAudioSuccess();

  @override
  List<Object> get props => [];
}

class LikeAudioFailure extends LikeAudioState {
  final dynamic error;

  const LikeAudioFailure({
    this.error,
  });

  @override
  List<Object> get props => [];
}
