import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_new_user_event.dart';
part 'register_new_user_state.dart';

class RegisterNewUserBloc
    extends Bloc<RegisterNewUserEvent, RegisterNewUserState> {
  RegisterNewUserBloc() : super(const RegisterNewUserInitial());

  @override
  Stream<RegisterNewUserState> mapEventToState(
      RegisterNewUserEvent event) async* {
    if (event is RegisterNewUser) {
      yield const RegisterNewUserInProgress();

      try {
        Map<String, String> userAttributes = {
          "email": event.userEmail,
        };

        SignUpResult res = await Amplify.Auth.signUp(
          username: event.username,
          password: event.userPassword,
          options: CognitoSignUpOptions(
            userAttributes: userAttributes,
          ),
        );
        
        if (res.isSignUpComplete == true) {
          yield const RegisterNewUserSuccess();
        } else {
          yield const RegisterNewUserFailure();
        }
      } on AuthException catch (error) {
        yield RegisterNewUserFailure(error: error.message);
      }
    }
  }
}
