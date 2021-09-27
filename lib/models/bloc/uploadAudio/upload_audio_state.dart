part of './upload_audio_bloc.dart';

abstract class UploadAudioState {
  const UploadAudioState();

  @override
  List<Object> get props => [];
}

class UploadAudioInitial extends UploadAudioState {
  const UploadAudioInitial();

  @override
  List<Object> get props => [];
}

class UploadAudioInProgress extends UploadAudioState {
  const UploadAudioInProgress();

  @override
  List<Object> get props => [];
}

class UploadAudioSuccess extends UploadAudioState {
  const UploadAudioSuccess();

  @override
  List<Object> get props => [];
}

class UploadAudioFailure extends UploadAudioState {
  final dynamic error;

  const UploadAudioFailure({this.error});

  @override
  List<Object> get props => [error];
}
