import 'package:flutter/material.dart';

import '../ModelProvider.dart';

class CurrentUser {
  final String email;
  final bool isCreator;
  String? creatorID;
  List<Audio>? audioUploads;

  CurrentUser({
    required this.email,
    required this.isCreator,
    this.creatorID,
    this.audioUploads,
  });
}

class CurrentUserData with ChangeNotifier {
  CurrentUser? _currentUser;

  set setCurrentUserData(CurrentUser userData) {
    _currentUser = userData;
  }

  set setAudioList(List<Audio> audioList) {
    _currentUser!.audioUploads = audioList;
  }

  get currnetUser => _currentUser;
}
