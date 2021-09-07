import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import './reset_password_successful_screen.dart';
import '../../widgets/text_field_with_icon.dart';

import '../../models/bloc/userAuthentication/forgotPassword/newPasswordReset/reset_new_password_bloc.dart';

class ResetNewPasswordScreen extends StatefulWidget {
  const ResetNewPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = "/resetNewPasswordScreen";

  @override
  State<ResetNewPasswordScreen> createState() => _ResetNewPasswordScreenState();
}

class _ResetNewPasswordScreenState extends State<ResetNewPasswordScreen> {
  final TextEditingController _confirmationCodeController =
      TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _confirmationCodeController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final ResetNewPasswordBloc resetNewPasswordBloc =
        BlocProvider.of<ResetNewPasswordBloc>(context);

    return BlocConsumer<ResetNewPasswordBloc, ResetNewPasswordState>(
      listener: (context, state) {
        if (state is ResetNewPasswordSuccess) {
          Navigator.of(context).pushReplacementNamed(ResetPasswordSuccessfulScreen.routeName);
        } else if (state is ResetNewPasswordFailure) {
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
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 20,
                width: double.infinity,
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
                        "Enter the confirmation code we just sent to your EMail...",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: PinCodeTextField(
                        appContext: context,
                        onChanged: (value) {},
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.scale,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          activeFillColor: Colors.white,
                          selectedColor: Colors.yellow,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                        ),
                        cursorColor: Colors.indigo,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: _confirmationCodeController,
                      ),
                    ),
                    const Divider(),
                    TextFieldWithIcon(
                      textController: _newPasswordController,
                      title: "New Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.redAccent,
                      ),
                      isPasswordField: true,
                      borderColor: Colors.indigo,
                      iconColor: Colors.redAccent,
                    ),
                    TextFieldWithIcon(
                      textController: _confirmNewPasswordController,
                      title: "Re-enter New Password",
                      textInputAction: TextInputAction.done,
                      prefixIcon: const Icon(
                        Icons.lock,
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
                          resetNewPasswordBloc.add(
                            ResetPassword(
                              userEmail: args["email"]!,
                              confirmationCode:
                                  _confirmationCodeController.text.trim(),
                              newPassword: _newPasswordController.text.trim(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
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
                        child: state is ResetNewPasswordInProgress
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Reset Password",
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
            ),
          ),
        );
      },
    );
  }
}
