import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/colors.dart';

// ignore: must_be_immutable
class CustomButtonWithIcon extends StatelessWidget {
  CustomButtonWithIcon({
    super.key,
    required this.name,
    required this.task,
    required this.icon,
    required this.active,
  });

  String name;
  Function task;
  IconData icon;
  bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
         task();
        },
        child: Container(
            height: 51.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: active==true ? purpleColor : whiteColor,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: active==false ? containerShadowClr :Colors.transparent),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(
                  icon,
                  color: active==true? whiteColor : blackTextColor,
                  size: 30,
                ),
                const SizedBox(width: 10,),
                Text(
                  name,
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: active==true? whiteColor : blackTextColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
        ));
  }
}
