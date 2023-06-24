import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
   CommonText({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold

      ),
    );
  }
}