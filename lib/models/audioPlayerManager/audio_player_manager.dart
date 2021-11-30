import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum ButtonState {
  paused,
  playing,
  loading,
}

class ProgressBarState {
  final Duration current;
  final Duration buffered;
  final Duration total;

  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
}

class AudioPlayerManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late AudioPlayer _audioPlayer;
  String? url;

  AudioPlayerManager({
    required this.url,
  }) {
    _init();
  }

  void _init() async {
    // initialize the song
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url!);

    _audioPlayer.play();

    // listen for changes in player state
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;

      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (isPlaying) {
        buttonNotifier.value = ButtonState.playing;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    // listen for changes in play position
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    // listen for changes in the buffered position
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    // listen for changes in the total audio duration
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() async {
    await _audioPlayer.play();
  }

  void pause() async {
    await _audioPlayer.pause();
  }

  void toggleRepeat() async {
    if (_audioPlayer.loopMode == LoopMode.one) {
      await _audioPlayer.setLoopMode(LoopMode.one);
    } else {
      await _audioPlayer.setLoopMode(LoopMode.off);
    }
  }

  void volume(double value) async {
    await _audioPlayer.setVolume(value);
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void dispose() async {
    await _audioPlayer.dispose();
  }

  void goForward5Sec() async {
    if (_audioPlayer.position.inSeconds + 5 >=
        _audioPlayer.duration!.inSeconds) {
      _audioPlayer.seek(_audioPlayer.duration);
    } else {
      _audioPlayer.seek(Duration(seconds: _audioPlayer.position.inSeconds + 5));
    }
  }

  void goBackward5Sec() async {
    if (_audioPlayer.position.inSeconds - 5 <= 0) {
      _audioPlayer.seek(const Duration(seconds: 0));
    } else {
      _audioPlayer.seek(Duration(seconds: _audioPlayer.position.inSeconds - 5));
    }
  }
}
