import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/colors.dart';

// ignore: must_be_immutable
class ChatCustomButton extends StatelessWidget {
  ChatCustomButton({
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
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: purpleColor)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
                Icons.chat_outlined,
                size: 18.sp,
                color: blackTextColor,
              ),

              SizedBox(width: 10.w,),
              Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: 15.h,
                  color: blackTextColor,
                  fontWeight: FontWeight.w400),
            ),
            ],)
          ),
        ));
  }
}
