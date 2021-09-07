import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part './reset_new_password_event.dart';
part './reset_new_password_state.dart';

class ResetNewPasswordBloc
    extends Bloc<ResetNewPasswordEvent, ResetNewPasswordState> {
  ResetNewPasswordBloc() : super(const ResetNewPasswordInitial());

  @override
  Stream<ResetNewPasswordState> mapEventToState(
      ResetNewPasswordEvent event) async* {
    if (event is ResetPassword) {
      yield const ResetNewPasswordInProgress();

      try {
        UpdatePasswordResult res = await Amplify.Auth.confirmPassword(
          username: event.userEmail,
          newPassword: event.newPassword,
          confirmationCode: event.confirmationCode,
        );

        yield const ResetNewPasswordSuccess();
      } on AmplifyException catch (error) {
        yield ResetNewPasswordFailure(error: error.message);
      }
    }
  }
}
