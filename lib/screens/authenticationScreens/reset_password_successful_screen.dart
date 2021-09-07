import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import './login_screen.dart';

class ResetPasswordSuccessfulScreen extends StatelessWidget {
  const ResetPasswordSuccessfulScreen({Key? key}) : super(key: key);

  static const routeName = "resetPasswordSuccessful";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 140,
                  width: 140,
                  child: Image.asset(
                    "assets/icons/SuccessTick.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password Changed!",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your password has been changed successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
                child: const Text(
                  "Back to Log In",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
