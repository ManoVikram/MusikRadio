part of './reset_new_password_bloc.dart';

abstract class ResetNewPasswordEvent extends Equatable {
  const ResetNewPasswordEvent();

  @override
  List<Object> get props => [];
}

class ResetPassword extends ResetNewPasswordEvent {
  final String userEmail;
  final String confirmationCode;
  final String newPassword;

  const ResetPassword({
    required this.userEmail,
    required this.confirmationCode,
    required this.newPassword,
  });

  @override
  List<Object> get props => [userEmail, confirmationCode, newPassword];
}
