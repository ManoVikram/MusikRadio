import 'package:flutter/material.dart';

import '../ModelProvider.dart';

class CurrentUser {
  final String email;
  final String userID;
  final bool isCreator;
  String? name;
  String? description;
  String? profilePictureURL;
  List<String>? followers;
  List<Audio>? audioUploads;

  CurrentUser({
    required this.email,
    required this.userID,
    this.isCreator = false,
    this.name,
    this.description,
    this.profilePictureURL,
    this.followers,
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

  get currentUser => _currentUser;
}
