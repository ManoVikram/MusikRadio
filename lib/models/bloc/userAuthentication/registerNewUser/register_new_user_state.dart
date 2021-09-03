part of 'register_new_user_bloc.dart';

class UserData {
  final String userEmail;

  const UserData({required this.userEmail});
}

abstract class RegisterNewUserState {
  const RegisterNewUserState();

  @override
  List<Object> get props => [];
}

class RegisterNewUserInitial extends RegisterNewUserState {
  const RegisterNewUserInitial();
}

class RegisterNewUserInProgress extends RegisterNewUserState {
  const RegisterNewUserInProgress();

  @override
  List<Object> get props => [];
}

class RegisterNewUserSuccess extends RegisterNewUserState {
  const RegisterNewUserSuccess();

  @override
  List<Object> get props => [];
}

class RegisterNewUserFailure extends RegisterNewUserState {
  final dynamic error;

  const RegisterNewUserFailure({this.error});

  @override
  List<Object> get props => [error];
}
