import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part './confirm_new_user_event.dart';
part './confirm_new_user_state.dart';

class ConfirmNewUserBloc
    extends Bloc<ConfirmNewUserEvent, ConfirmNewUserState> {
  ConfirmNewUserBloc() : super(const ConfirmCodeInitial());

  @override
  Stream<ConfirmNewUserState> mapEventToState(
      ConfirmNewUserEvent event) async* {
    if (event is ConfirmCode) {
      yield const ConfirmCodeInProgress();

      try {
        SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: event.userEmail!,
          confirmationCode: event.confirmationCode,
        );

        if (res.isSignUpComplete == true) {
          yield const ConfirmCodeSuccess();
        } else {
          yield const ConfirmCodeFailed();
        }
      } on AuthException catch (error) {
        yield ConfirmCodeFailed(error: error.message);
      }
    }
  }
}
