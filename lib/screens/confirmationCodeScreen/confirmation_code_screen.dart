import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmationCodeScreen extends StatelessWidget {
  ConfirmationCodeScreen({Key? key}) : super(key: key);

  static const String routeName = "/confirmationCodeScreen";

  final TextEditingController _confirmationCodeController =
      TextEditingController();

  Future<void> _confirmNewUser(String? userEmail) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: userEmail!,
        confirmationCode: _confirmationCodeController.text,
      );

      /* setState(() {
        isSignUpComplete = res.isSignUpComplete;
      }); */
    } on AuthException catch (error) {
      print(error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
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
                "Enter the confirmation code we just sent to your EMail...",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  _confirmNewUser(args["email"]);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
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
                child: Text(
                  "Verify!",
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
  }
}
