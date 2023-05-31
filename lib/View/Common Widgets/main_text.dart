import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainTextWidget extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;

  MainTextWidget(
      {required this.text,
      required this.fontColor,
      required this.fontSize,
      required this.fontWeight,
        required this.align,

      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: fontColor,
        fontSize: fontSize.h,
        fontWeight: fontWeight,
        height: 1.0,
      ),
      textAlign: align,
    );
  }
}
