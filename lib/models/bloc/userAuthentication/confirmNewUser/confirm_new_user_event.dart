part of './confirm_new_user_bloc.dart';

abstract class ConfirmNewUserEvent extends Equatable {
  const ConfirmNewUserEvent();

  @override
  List<Object> get props => [];
}

class ConfirmCode extends ConfirmNewUserEvent {
  final String? userEmail;
  final String confirmationCode;

  const ConfirmCode({
    this.userEmail,
    required this.confirmationCode,
  });

  @override
  List<Object> get props => [confirmationCode];
}
