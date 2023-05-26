import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haylo_app/Controller/controller.dart';
import 'package:haylo_app/View/Common%20Widgets/common_text.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_button2.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Common%20Widgets/social_button.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Authentication/forgot_password.dart';
import '../../Constants/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.black12,
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.only(
              left: 25, right: 25, bottom: 25, top: screenHeight * 0.1),
          child: SingleChildScrollView(

            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Welcome Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.2,
                          child: Image.asset('assets/images/hands.png')),
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
                    height: screenHeight * 0.05,
                  ),
                  //____________________________EMAIL  SECTION
                  CommonText(text: 'Email Address'),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  CustomTextField(
                      controller: Get.find<LoginController>().emailCtrl,
                      hintText: 'Enter Your, Email',
                      abscr: false),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  //____________________________PASSWORD  SECTION
                  CommonText(text: 'Password'),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  CustomTextField(
                      controller: Get.find<LoginController>().emailCtrl,
                      hintText: 'Enter Password',
                      abscr: false),

                  SizedBox(
                    height: screenHeight * 0.03,
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
                                  onChanged: (value) {}),
                              CommonText(text: 'Remember Me'),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              moveRTL(screen: const ForgotPasswordView());
                            },
                            child: Text(
                              'Forgot Password',
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
                    height: screenHeight * 0.04,
                  ),
                  CustomButton2(name: 'Login', task: () {}),
                  const OrSection(),
                  const SocialSection(),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont Have an Account',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//___________________OR SECTION WIDGET

class OrSection extends StatelessWidget {
  const OrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        children: [
          const Expanded(
            flex: 30,
            child: Divider(
              color: grayColor,
              thickness: 2,
            ),
          ),
          Expanded(
              flex: 40,
              child: Center(child: CommonText(text: 'or login with'))),
          const Expanded(
            flex: 30,
            child: Divider(
              color: grayColor,
              thickness: 2,
            ),
          )
        ],
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
                image: facebook_logo, buttonName: 'Facebook', task: () {}),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Expanded(
            child: CustomSocialButton(
                image: google_logo, buttonName: 'Google', task: () {}),
          ),
        ],
      ),
    );
  }
}
