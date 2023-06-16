import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/Authentication/forgotpassword_controller.dart';
import 'package:haylo_app/Controller/Authentication/varificationcode_controller.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_loadingbutton.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import '../../../Controller/Authentication/resetpassword_controller.dart';
import '../../Common Widgets/common_text.dart';
import '../../Common Widgets/custom_button2.dart';
import '../../Common Widgets/custom_textfield.dart';
import 'package:get/get.dart';

import '../../Common Widgets/varificationcode_input.dart';
import '../../Constants/images.dart';
import '../../Constants/regix.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var controller = Get.put(ResetPasswordController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //_____________________TOP BACK ARROW
                SizedBox(
                  width: screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: screenHeight * 0.03,
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black45,
                              size: screenHeight * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //_____________________TOP HEADER IMAGE

                Container(
                  height: screenHeight * 0.3,
                  width: screenHeight * 0.3,
                  //color: Colors.purple,
                  child: Image.asset(
                    forgotPasswordImg,
                    fit: BoxFit.fitWidth,
                  ),
                ),

                //__________________MID TEXT
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter Verification Code',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 24,
                        //fontSize: calculateFontSize(context, 24),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),

                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        'Enter the verification code we sent to\n johnmichel00@gmail.com',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          //fontSize: calculateFontSize(context, 13),
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),

                //________________EMAIL SECTION
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonText(text: 'New Password'),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller: controller.confirmPasswordCtrl,
                          hintText: 'Enter New Password',
                          abscr: true,
                          error: 'Enter Strong Password',
                          pattern: passwordRegix,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonText(text: 'Confirm Password'),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          controller: controller.passwordCtrl,
                          hintText: 'Confirm New Password',
                          abscr: true,
                          error: 'Enter Strong Password',
                          pattern: passwordRegix,
                        ),
                      ],
                    ),
                  ),
                ),

                //_______________FORGOT BUTTON
                Padding(
                  padding: EdgeInsets.only(
                      left: 25, right: 25, bottom: screenHeight * 0.1),
                  child: Column(
                    children: [

                      const SizedBox(
                        height: 8.0,
                      ),
                      GetBuilder<ResetPasswordController>(
                          builder: (controller) {
                            return controller.isloading == false
                                ? CustomButton2(
                                name: 'Save Password', task: () {
                                  controller.resetNewPassword();
                            })
                                : const CustomLoadingButton();
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
