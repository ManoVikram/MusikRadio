part of './confirm_new_user_bloc.dart';

class ConfirmationUserData {
  final String userEmail;

  const ConfirmationUserData({
    required this.userEmail,
  });
}

abstract class ConfirmNewUserState {
  const ConfirmNewUserState();

  @override
  List<Object> get props => [];
}

class ConfirmCodeInitial extends ConfirmNewUserState {
  const ConfirmCodeInitial();

  @override
  List<Object> get props => [];
}

class ConfirmCodeInProgress extends ConfirmNewUserState {
  const ConfirmCodeInProgress();

  @override
  List<Object> get props => [];
}

class ConfirmCodeSuccess extends ConfirmNewUserState {
  const ConfirmCodeSuccess();

  @override
  List<Object> get props => [];
}

class ConfirmCodeFailed extends ConfirmNewUserState {
  final dynamic error;

  const ConfirmCodeFailed({this.error});

  @override
  List<Object> get props => [error];
}
