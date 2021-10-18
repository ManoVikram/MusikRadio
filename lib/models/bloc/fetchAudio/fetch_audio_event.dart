part of './fetch_audio_bloc.dart';

abstract class FetchAudioEvent extends Equatable {
  const FetchAudioEvent();

  @override
  List<Object> get props => [];
}

class FetchAllAudio extends FetchAudioEvent {
  const FetchAllAudio();

  @override
  List<Object> get props => [];
}

class FetchCategoryAudio extends FetchAudioEvent {
  final AudioCategory category;

  const FetchCategoryAudio({required this.category});

  @override
  List<Object> get props => [category];
}
