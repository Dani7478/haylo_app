import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        controller: TextEditingController(),
        onSubmitted: (value) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                GoogleFonts.poppins(fontSize: 13.sp, color: Color(0xFF747474)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            border: InputBorder.none,
            suffixIcon: abscr == true
                ?  Icon(
                    Icons.remove_red_eye_outlined,
                    color: grayColor,
                    size: 20.sp,
                  )
                : const SizedBox()),
        obscureText: abscr,
      ),
    );
  }
}
