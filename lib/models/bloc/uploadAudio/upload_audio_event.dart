part of './upload_audio_bloc.dart';

abstract class UploadAudioEvent extends Equatable {
  const UploadAudioEvent();

  @override
  List<Object> get props => [];
}

class UploadAudio extends UploadAudioEvent {
  final String title;
  final String description;
  final String category;
  final FilePickerResult audioResult;
  final XFile? thumbnailResult;

  const UploadAudio({
    required this.title,
    required this.description,
    required this.category,
    required this.audioResult,
    this.thumbnailResult,
  });

  @override
  List<Object> get props => [title, description, audioResult];
}
