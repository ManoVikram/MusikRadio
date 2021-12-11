part of './like_audio_bloc.dart';

abstract class LikeAudioEvent extends Equatable {
  const LikeAudioEvent();

  @override
  List<Object> get props => [];
}

class ToggleLike extends LikeAudioEvent {
  final String audioID;

  const ToggleLike({
    required this.audioID,
  });

  @override
  List<Object> get props => [audioID];
}
