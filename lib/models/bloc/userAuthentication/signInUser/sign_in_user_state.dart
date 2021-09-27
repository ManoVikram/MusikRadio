part of './sign_in_user_bloc.dart';

class UserData {
  final String userEmail;

  const UserData({required this.userEmail});
}

abstract class SignInUserState {
  const SignInUserState();

  @override
  List<Object> get props => [];
}

class SignInUserInitial extends SignInUserState {
  const SignInUserInitial();

  @override
  List<Object> get props => [];
}

class SignInUserInProgress extends SignInUserState {
  const SignInUserInProgress();

  @override
  List<Object> get props => [];
}

class SignInUserSuccess extends SignInUserState {
  const SignInUserSuccess();

  @override
  List<Object> get props => [];
}

class SignInUserNotConfirmed extends SignInUserState {
  const SignInUserNotConfirmed();

  @override
  List<Object> get props => [];
}

class SignInUserFailure extends SignInUserState {
  final dynamic error;

  const SignInUserFailure({this.error});

  @override
  List<Object> get props => [error];
}
