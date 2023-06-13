import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/colors.dart';

// ignore: must_be_immutable
class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: purpleColor, borderRadius: BorderRadius.circular(26)),
      child: const Center(
          child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: whiteColor,
          strokeWidth: 3,
        ),
      )),
    );
  }
}
