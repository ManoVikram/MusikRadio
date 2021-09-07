import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordInitial());

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is ForgotPassword) {
      yield const ForgotPasswordInProgress();

      try {
        ResetPasswordResult res = await Amplify.Auth.resetPassword(
          username: event.userEmail,
        );

        if (res.nextStep.updateStep == "CONFIRM_RESET_PASSWORD_WITH_CODE") {
          yield const ForgotPasswordConfirmationCodeSent();
        } else {
          yield const ForgotPasswordFailure();
        }
      } on AmplifyException catch (error) {
        yield ForgotPasswordFailure(error: error.message);
      }
    }
  }
}
