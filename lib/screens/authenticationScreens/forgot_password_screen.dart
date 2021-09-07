import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_new_password_screen.dart';
import '../../widgets/text_field_with_icon.dart';

import '../../models/bloc/userAuthentication/forgotPassword/forgotPasswordEmail/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = "/forgotPasswordScreen";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordBloc forgotPasswordBloc =
        BlocProvider.of<ForgotPasswordBloc>(context);

    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordConfirmationCodeSent) {
          Navigator.of(context).pushNamed(
            ResetNewPasswordScreen.routeName,
            arguments: {"email": _emailController.text.trim()},
          );
        } else if (state is ForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? "ERROR!!"),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                      ),
                      iconSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Enter your EMail to reset the password...",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                TextFieldWithIcon(
                  textController: _emailController,
                  title: "EMail",
                  textInputAction: TextInputAction.done,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.redAccent,
                  ),
                  isPasswordField: false,
                  borderColor: Colors.indigo,
                  iconColor: Colors.redAccent,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      forgotPasswordBloc.add(
                        ForgotPassword(
                          userEmail: _emailController.text.trim(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      elevation: 5,
                    ),
                    child: state is ForgotPasswordInProgress
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 24,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
