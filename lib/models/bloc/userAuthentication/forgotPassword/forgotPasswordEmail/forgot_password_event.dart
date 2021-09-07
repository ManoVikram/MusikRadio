part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get prop => [];
}

class ForgotPassword extends ForgotPasswordEvent {
  final String userEmail;

  const ForgotPassword({required this.userEmail});

  @override
  List<Object> get props => [userEmail];
}
