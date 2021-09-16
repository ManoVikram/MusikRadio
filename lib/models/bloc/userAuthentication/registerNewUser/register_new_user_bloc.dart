import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../User.dart';

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
        SignUpResult res = await Amplify.Auth.signUp(
          username: event.userEmail,
          password: event.userPassword,
        );

        if (res.isSignUpComplete == true) {
          User newUser = User(
            createdOn: TemporalDateTime(DateTime.now()),
            email: event.userEmail,
            isCreator: false,
          );

          try {
            await Amplify.DataStore.save(newUser);
          } catch (error) {
            print(error);
          }
          
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
