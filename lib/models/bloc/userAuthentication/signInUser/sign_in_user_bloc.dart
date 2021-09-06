import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part './sign_in_user_event.dart';
part './sign_in_user_state.dart';

class SignInUserBloc extends Bloc<SignInUserEvent, SignInUserState> {
  SignInUserBloc() : super(const SignInUserInitial());

  @override
  Stream<SignInUserState> mapEventToState(SignInUserEvent event) async* {
    if (event is SignInUser) {
      yield const SignInUserInProgress();

      try {
        SignInResult res = await Amplify.Auth.signIn(
          username: event.userEmail,
          password: event.userPassword,
        );

        if (res.isSignedIn == true) {
          yield const SignInUserSuccess();
        } else {
          yield const SignInUserFailure();
        }
      } on UserNotConfirmedException catch (error) {
        yield const SignInUserNotConfirmed();
      } on AuthException catch (error) {
        yield SignInUserFailure(error: error.message);
      }
    }
  }
}
