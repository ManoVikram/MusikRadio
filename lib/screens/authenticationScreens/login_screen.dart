import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './signup_screen.dart';
// import '../confirmationCodeScreen/confirmation_code_screen.dart';
import '../../widgets/text_field_with_icon.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "assets/images/authenticationScreens/SignInIllustration.png",
                  ),
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 28.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      TextFieldWithIcon(
                        textController: _emailController,
                        title: "Email",
                        isPasswordField: false,
                        borderColor: Colors.greenAccent,
                        iconColor: Colors.redAccent,
                      ),
                      TextFieldWithIcon(
                        textController: _passwordController,
                        title: "Password",
                        isPasswordField: true,
                        borderColor: Colors.greenAccent,
                        iconColor: Colors.redAccent,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: GoogleFonts.roboto().fontFamily,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // if user is not verified take him to OTP Screen
                            // else take him to Home Screen

                            // if the user's email doesn't exist or entered a wrong password, inform him with a Snackbar in red

                            /* Navigator.of(context)
                                .pushNamed(OtpScreen.routeName); */
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 24,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 13,
                            ),
                          ),
                          child: const Text(
                            "Log In",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 5,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/Google_Logo.svg"),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Log In With Google",
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
                            "New here?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignupScreen.routeName);
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
                              "Create An Account",
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
    );
  }
}
