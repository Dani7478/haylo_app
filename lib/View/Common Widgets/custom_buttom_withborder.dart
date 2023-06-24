import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/colors.dart';

// ignore: must_be_immutable
class CustomButtonWithBorder extends StatelessWidget {
  CustomButtonWithBorder({
    super.key,
    required this.name,
    required this.task,
  });

  String name;
  Function task;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          task();
        },
        child: Container(
          height: 51.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor, 
              border: Border.all(color: purpleColor, width: 1.5),
              borderRadius: BorderRadius.circular(26)),
          child: Center(
            child: Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: purpleColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
