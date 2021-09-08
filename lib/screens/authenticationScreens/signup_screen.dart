import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import './login_screen.dart';
import '../confirmationCodeScreen/confirmation_code_screen.dart';
import '../../widgets/text_field_with_icon.dart';

import '../../models/bloc/userAuthentication/registerNewUser/register_new_user_bloc.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signupScreen";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isSignUpComplete = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegisterNewUserBloc registerNewUserBloc =
        BlocProvider.of<RegisterNewUserBloc>(context);

    return BlocConsumer<RegisterNewUserBloc, RegisterNewUserState>(
      listener: (context, state) {
        if (state is RegisterNewUserSuccess) {
          Navigator.of(context).pushNamed(
            ConfirmationCodeScreen.routeName,
            arguments: {
              "email": _emailController.text.trim(),
            },
          );
        } else if (state is RegisterNewUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? "ERROR!!"),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFf3fbf8),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      "assets/images/authenticationScreens/SignUpIllustration1.png",
                    ),
                    // child: SvgPicture.asset("assets/images/authenticationScreens/SignUpIllustration1.svg"),
                  ),
                  Text(
                    "Create Account!",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 28.0,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        TextFieldWithIcon(
                          textController: _emailController,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 14.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.redAccent,
                            ),
                          ),
                          title: "Email",
                          isPasswordField: false,
                          borderColor: Colors.greenAccent,
                          iconColor: Colors.redAccent,
                        ),
                        TextFieldWithIcon(
                          textController: _passwordController,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 14.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            ),
                          ),
                          title: "Password",
                          textInputAction: TextInputAction.done,
                          isPasswordField: true,
                          borderColor: Colors.greenAccent,
                          iconColor: Colors.redAccent,
                        ),
                                                const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              registerNewUserBloc.add(
                                RegisterNewUser(
                                  userEmail: _emailController.text.trim(),
                                  userPassword: _passwordController.text.trim(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 24,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 76,
                                vertical: 13,
                              ),
                            ),
                            child: state is RegisterNewUserInProgress
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Sign Up",
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 76,
                            vertical: 10,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/Google_Logo.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Sign Up With Google",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    LoginScreen.routeName);
                              },
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "Log In Here",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
