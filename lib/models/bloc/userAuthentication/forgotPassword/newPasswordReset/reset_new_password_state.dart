part of './reset_new_password_bloc.dart';

abstract class ResetNewPasswordState {
  const ResetNewPasswordState();

  @override
  List<Object> get props => [];
}

class ResetNewPasswordInitial extends ResetNewPasswordState {
  const ResetNewPasswordInitial();

  @override
  List<Object> get props => [];
}

class ResetNewPasswordInProgress extends ResetNewPasswordState {
  const ResetNewPasswordInProgress();

  @override
  List<Object> get props => [];
}

class ResetNewPasswordSuccess extends ResetNewPasswordState {
  const ResetNewPasswordSuccess();

  @override
  List<Object> get props => [];
}

class ResetNewPasswordFailure extends ResetNewPasswordState {
  final dynamic error;

  const ResetNewPasswordFailure({
    this.error,
  });

  @override
  List<Object> get props => [error];
}
