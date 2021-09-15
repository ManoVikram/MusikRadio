import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.text,
    required this.emoji,
    required this.onTapped,
    this.isSelected = false,
  }) : super(key: key);

  final String text;
  final String emoji;
  final bool isSelected;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: onTapped,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: Colors.black,
            ),
          ),
          backgroundColor: isSelected ? Colors.redAccent : Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 20 : 14,
            vertical: 5.0,
          ),
        ),
        child: Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 18,
                color: isSelected ? Colors.white : Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
