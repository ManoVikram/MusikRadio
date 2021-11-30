import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part './audio_player_event.dart';
part './audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc() : super(const AudioPlayerInitial()) {
    on<AudioPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
