// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';

class CustomDropdownWidget extends StatelessWidget {
  List<String> itemList;
  String selectedItem;


  CustomDropdownWidget(
      {required this.itemList, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: grayColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  value: selectedItem,
                  onChanged: (String? newValue) {
                 
                  
                  },
                  items: itemList.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: Color(0xFF747474),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  icon: SizedBox.shrink(),
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: blackTextColor,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
