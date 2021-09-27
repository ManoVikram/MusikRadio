import 'package:flutter/material.dart';

class CurrentUser {
  final String email;
  final bool isCreator;

  const CurrentUser({
    required this.email,
    required this.isCreator,
  });
}

class CurrentUserData with ChangeNotifier {
  CurrentUser? _currentUser;

  set setCurrentUserData(CurrentUser userData) {
    _currentUser = userData;
  }

  get currnetUser => _currentUser;
}
