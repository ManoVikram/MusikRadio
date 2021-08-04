import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: isSelected ? Colors.redAccent : Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 14,
          vertical: 5.0,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 20,
          color: isSelected ? Colors.white : Colors.blueGrey,
        ),
      ),
    );
  }
}
