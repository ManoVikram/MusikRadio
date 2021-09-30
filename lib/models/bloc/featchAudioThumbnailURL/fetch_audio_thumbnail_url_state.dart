part of './fetch_audio_thumbnail_url_bloc.dart';

abstract class FetchURLState {
  const FetchURLState();

  @override
  List<Object> get props => [];
}

class FetchURLInitial extends FetchURLState {
  const FetchURLInitial();

  @override
  List<Object> get props => [];
}

class FetchURLInProgress extends FetchURLState {
  const FetchURLInProgress();

  @override
  List<Object> get props => [];
}

class FetchURLSuccess extends FetchURLState {
  final List<Map<String, String>> uploadedContentUrl;

  const FetchURLSuccess({
    required this.uploadedContentUrl,
  });

  @override
  List<Object> get props => [];
}

class FetchURLFailure extends FetchURLState {
  final dynamic error;

  const FetchURLFailure({
    this.error,
  });

  @override
  List<Object> get props => [error];
}
