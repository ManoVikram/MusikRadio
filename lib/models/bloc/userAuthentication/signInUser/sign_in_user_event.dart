part of './sign_in_user_bloc.dart';

abstract class SignInUserEvent extends Equatable {
  const SignInUserEvent();

  @override
  List<Object> get props => [];
}

class SignInUser extends SignInUserEvent {
  final String userEmail;
  final String userPassword;

  const SignInUser({
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object> get props => [];
}
