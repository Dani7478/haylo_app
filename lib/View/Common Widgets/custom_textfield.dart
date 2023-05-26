import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/responsive_calculator.dart';

import '../Constants/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.abscr});

  final TextEditingController controller;
  final String hintText;
  final bool abscr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: grayColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 13,
            color: Color(0xFF747474)
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          border: InputBorder.none,
        ),
        obscureText: abscr,
      ),
    );
  }
}
