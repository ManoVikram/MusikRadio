part of './fetch_audio_thumbnail_url_bloc.dart';

abstract class FetchURLEvent extends Equatable {
  const FetchURLEvent();

  @override
  List<Object> get props => [];
}

class FetchCurrentCreatorContentURL extends FetchURLEvent {
  final List<Audio> uploadedAudio;

  const FetchCurrentCreatorContentURL({
    required this.uploadedAudio,
  });

  @override
  List<Object> get props => [uploadedAudio];
}
