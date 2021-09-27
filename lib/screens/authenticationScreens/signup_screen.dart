import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<RegisterNewUserBloc, RegisterNewUserState>(
      listener: (context, state) async {
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
            physics: const BouncingScrollPhysics(),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/authenticationScreens/SignUpIllustration1.png",
                    height: size.height * 0.25,
                  ),
                  Text(
                    "Create Account!",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 26.0,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  ElevatedButton(
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
                      fixedSize: Size(size.width * 0.65, 60),
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                      ),
                      /* padding: const EdgeInsets.symmetric(
                        horizontal: 76,
                        vertical: 13,
                      ), */
                    ),
                    child: state is RegisterNewUserInProgress
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Sign Up",
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                      ),
                      fixedSize: Size(size.width * 0.65, 60),
                      /* padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ), */
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/icons/Google_Logo.svg"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: AutoSizeText(
                            "SignUp  With Google",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            minFontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
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
          ),
        ),
      ),
    );
  }
}
