part of './audio_player_bloc.dart';

abstract class AudioPlayerState extends Equatable {
  const AudioPlayerState();

  @override
  List<Object> get props => [];
}

class AudioPlayerInitial extends AudioPlayerState {
  const AudioPlayerInitial();

  @override
  List<Object> get props => [];
}

class AudioPlayerInProgress extends AudioPlayerState {
  const AudioPlayerInProgress();

  @override
  List<Object> get props => [];
}

class AudioPlayerFailure extends AudioPlayerState {
  const AudioPlayerFailure();

  @override
  List<Object> get props => [];
}

class PlayAudioSuccess extends AudioPlayerState {
  const PlayAudioSuccess();

  @override
  List<Object> get props => [];
}

class PauseAudioSuccess extends AudioPlayerState {
  const PauseAudioSuccess();

  @override
  List<Object> get props => [];
}
