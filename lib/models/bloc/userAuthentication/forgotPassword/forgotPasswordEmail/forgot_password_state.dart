part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInProgress extends ForgotPasswordState {
  const ForgotPasswordInProgress();

  @override
  List<Object> get props => [];
}

class ForgotPasswordConfirmationCodeSent extends ForgotPasswordState {
  const ForgotPasswordConfirmationCodeSent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final dynamic error;

  const ForgotPasswordFailure({this.error});

  @override
  List<Object> get props => [error];
}
