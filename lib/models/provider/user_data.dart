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
  String? creatorID;
  List<Audio>? audioUploads;

  CurrentUser({
    required this.email,
    required this.userID,
    required this.isCreator,
    this.name,
    this.description,
    this.profilePictureURL,
    this.followers,
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
