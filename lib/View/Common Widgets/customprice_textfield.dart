import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import '../Constants/colors.dart';

class CustomPriceTextField extends StatefulWidget {
  const CustomPriceTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.pattern,
    required this.error,
  });

  final TextEditingController controller;
  final String hintText;
  final String pattern;
  final String error;

  @override
  State<CustomPriceTextField> createState() => _CustomPriceTextFieldState();
}

bool isEmailValid = true;

class _CustomPriceTextFieldState extends State<CustomPriceTextField> {
  @override
  Widget build(BuildContext context) {
    bool isValidate(String input) {
      RegExp regex = RegExp(widget.pattern);
      return regex.hasMatch(input);
    }

    return Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: grayColor,
        //     width: 1.0,
        //   ),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        child: TextField(
      controller: widget.controller,
      onSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
      onChanged: (value) {
        setState(() {
          isEmailValid = isValidate(value);
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        errorText: isEmailValid ? null : widget.error,
        hintText: widget.hintText,
        hintStyle:
            GoogleFonts.poppins(fontSize: 13.sp, color: Color(0xFF747474)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        // border: InputBorder.none,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: MainTextWidget(
            fontColor: blackTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            text: '/hr',
            align: TextAlign.center,
          ),
        ),
      ),
    ));
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
    );
  }
}
