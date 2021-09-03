part of 'register_new_user_bloc.dart';

abstract class RegisterNewUserEvent extends Equatable {
  const RegisterNewUserEvent();

  @override
  List<Object> get props => [];
}

class RegisterNewUser extends RegisterNewUserEvent {
  final String userEmail;
  final String userPassword;

  const RegisterNewUser({
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object> get props => [userEmail, userPassword];
}
