import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/consts.dart';
import 'widgets_links.dart';

class CustomFunctions {
  reviewDialogue() {
    Get.defaultDialog(
        title: '',
        middleText: '',
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
          child: Column(
            children: [
              MainTextWidget(
                  text: 'Add Service Request',
                  fontColor: blackTextColor,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center),
              SizedBox(height: 10.h),
              MainTextWidget(
                  text:
                      'Type any service name that you want us to add in the list',
                  fontColor: blackTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  align: TextAlign.center),
              SizedBox(height: 20.h),
              CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Type Here',
                  abscr: false,
                  
                  error: 'field must be filled',
                  pattern: nameRegix,
                  ),
                  
              SizedBox(height: 25.h),
              CustomButton2(name: 'Send', task: () {}),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: MainTextWidget(
                    text: 'Cancel',
                    fontColor: blackTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    align: TextAlign.center),
              ),
            ],
          ),
        ));
  }

  confirmationDialogue(
    title,
    subtitle,
    btn1Text,
    btn2Text,
    task1,
    task2,
  ) {
    Get.defaultDialog(
        title: '',
        middleText: '',
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
          child: Column(
            children: [
              MainTextWidget(
                  text: title,
                  fontColor: blackTextColor,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center),
              SizedBox(height: 10.h),
              MainTextWidget(
                  text: subtitle,
                  fontColor: blackTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  align: TextAlign.center),
              SizedBox(height: 25.h),
              CustomButton2(
                  name: btn1Text,
                  task: () {
                    task1();
                  }),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  task2();
                },
                child: MainTextWidget(
                    text: btn2Text,
                    fontColor: blackTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    align: TextAlign.center),
              ),
            ],
          ),
        ));
  }
}
