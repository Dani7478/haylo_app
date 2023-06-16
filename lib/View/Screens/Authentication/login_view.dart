import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Common%20Widgets/common_text.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_button2.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Common%20Widgets/social_button.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Authentication/forgot_password.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerhome_view.dart';
import 'package:haylo_app/View/Screens/Home/signup_selection.dart';
import '../../Common Widgets/widgets_links.dart';
import '../../Constants/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var controller = Get.put(LoginController());

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding:
              EdgeInsets.only(left: 25.h, right: 25.h, bottom: 25.h, top: 50.h),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Welcome Back !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      height: screenWidth * 0.2,
                      width: screenWidth * 0.2,
                      child: Image.asset(loginHandImg)),
                ],
              ),
              const Text(
                "Hello, you've been missed!",
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //____________________________EMAIL  SECTION
              CommonText(text: 'Email Address'),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                  controller: Get.find<LoginController>().emailCtrl,
                  hintText: 'Enter Your, Email',
                  abscr: false,
                  error: 'Enter Valid Email',
                  pattern: emailRegix,
                  ),
                  
              SizedBox(
                height: 10.h,
              ),

              //____________________________PASSWORD  SECTION
              CommonText(text: 'Password'),
              SizedBox(
                height: 5.h,
              ),

              CustomTextField(
                  controller: Get.find<LoginController>().passwrdCtrl,
                  hintText: 'Enter Password',
                  abscr: true,
                  error: 'Enter Strong Password',
                  pattern: passwordRegix,
                  ),

              SizedBox(
                height: 10.h,
              ),

              //________________________________REMEMBER SECTION
              GetBuilder<LoginController>(
                init: LoginController(),
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: controller.isremember,
                              onChanged: (value) {
                                controller.changeIsRemember();
                                
                              }),
                          CommonText(text: 'Remember Me'),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          moveRTL(screen: const ForgotPasswordView());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFFD40000),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(
                height: 20.h,
              ),
              GetBuilder<LoginController>(
                builder: (controller) {
                  return controller.isloading==false? CustomButton2(
                      name: 'Login',
                      task: () {
                        controller.login();
                      }):
                      const CustomLoadingButton();
                }
              ),
              SizedBox(
                height: 40.h,
              ),
              OrSection(
                text: 'or login with',
              ),
              SizedBox(
                height: 8.h,
              ),
              const SocialSection(),
              SizedBox(
                height: 100.h,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextButton(
                            onPressed: () {
                              moveLTR(screen: const SignupSelectionView());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//_______________________________SOCIAL SECTION
class SocialSection extends StatelessWidget {
  const SocialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Row(
        children: [
          Expanded(
            child: CustomSocialButton(
                image: facebookImg, buttonName: 'Facebook', task: () {}),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Expanded(
            child: CustomSocialButton(
                image: googleImg, buttonName: 'Google', task: () {}),
          ),
        ],
      ),
    );
  }
}
