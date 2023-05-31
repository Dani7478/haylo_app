import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';

class CustomFieldWithBottomBorder extends StatelessWidget {
  CustomFieldWithBottomBorder(
      {Key? key,
      required this.title,
      required this.hint,
      required this.abscr,
      required this.controller, required this.endicon})
      : super(key: key);
  String title;
  String hint;
  bool abscr;
  TextEditingController controller;
  IconData endicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTextWidget(
              text: title,
              fontColor: Color(0xFFAFAFAF),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          Container(
            decoration:const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,  // Replace with your desired border color
                  width: 1,  // Adjust the border width as needed
                ),
              ),
            ),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                FocusScope.of(context).nextFocus();
              },
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: const Color(0xFF1D2226),
                    fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                suffixIcon: Icon(endicon,size: 25.h,)

              ),

              obscureText: abscr,
            ),
          ),
        ],
      ),
    );
  }
}
