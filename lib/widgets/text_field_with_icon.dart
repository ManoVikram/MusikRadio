import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWithIcon extends StatelessWidget {
  const TextFieldWithIcon({
    Key? key,
    required TextEditingController textController,
    required this.title,
    required this.isPasswordField,
    required this.borderColor,
    required this.iconColor,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final String title;
  final bool isPasswordField;
  final Color borderColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextField(
            keyboardType: isPasswordField
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            autocorrect: false,
            controller: _textController,
            showCursor: true,
            cursorHeight: 24,
            cursorColor: Colors.redAccent,
            obscureText: isPasswordField ? true : false,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
            textInputAction:
                isPasswordField ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 20,
              ),
              prefixIcon: isPasswordField
                  ? Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Icon(
                        Icons.lock,
                        color: iconColor,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Icon(
                        Icons.person,
                        color: iconColor,
                      ),
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 3.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.blueGrey[50]!,
                  width: 3.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
