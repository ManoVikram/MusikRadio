part of './fetch_audio_bloc.dart';

class AudioData {
  final List<Audio> audio;
  final List<Map<String, String>> url;
  final List<String> channelName;

  const AudioData({
    required this.audio,
    required this.url,
    required this.channelName,
  });
}

abstract class FetchAudioState extends Equatable {
  const FetchAudioState();

  @override
  List<Object> get props => [];
}

class FetchAudioInitial extends FetchAudioState {
  const FetchAudioInitial();

  @override
  List<Object> get props => [];
}

class FetchAudioInProgress extends FetchAudioState {
  const FetchAudioInProgress();

  @override
  List<Object> get props => [];
}

class FetchAudioSuccess extends FetchAudioState {
  final AudioData audioData;

  const FetchAudioSuccess({
    required this.audioData,
  });

  @override
  List<Object> get props => [audioData];
}

class FetchAudioFailure extends FetchAudioState {
  final dynamic error;

  const FetchAudioFailure({
    this.error,
  });

  @override
  List<Object> get props => [error];
}
