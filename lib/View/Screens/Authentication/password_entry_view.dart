import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import '../../Common Widgets/widgets_links.dart';
import '../../Common Widgets/custom_textfield.dart';

class EntryPasswordView extends StatelessWidget {
  const EntryPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var Controller = Get.put(NewPassEntryController());
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          child: ListView(
            children: [
              //_____________________TOP HEADER IMAGE
              Container(
                height: 135.h,
                width: 203.w,
                //color: Colors.purple,
                child: Image.asset(
                  'assets/images/forgot-password.png',
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              MainTextWidget(
                  text: 'Enter New Password',
                  fontColor: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                align: TextAlign.left,
              ),

              MainTextWidget(
                  text: 'Enter the new password you want to set',
                  fontColor: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                align: TextAlign.left,
              ),

              SizedBox(
                height: 50.h,
              ),

              CommonText(text: 'New Password'),

              CustomTextField(
                  controller: Controller.passwordCtrl,
                  hintText: 'Enter Your, Email',
                  abscr: false,
                  error: 'Enter Valid Email',
                  pattern: emailRegix,
                  ),

              SizedBox(
                height: 30.h,
              ),

              CommonText(text: 'Confirm Password'),

              CustomTextField(
                  controller: Controller.confirmPasswordCtrl,
                  hintText: 'Confirm Password',
                  abscr: false,
                  error: 'Enter Strong password',
                  pattern: passwordRegix,
                  ),

              SizedBox(
                height: 70.h,
              ),

              CustomButton2(name: 'Save Password', task: () {})
            ],
          ),
        ),
      ),
    );
  }
}
