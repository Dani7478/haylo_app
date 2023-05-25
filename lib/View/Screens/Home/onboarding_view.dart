import 'package:flutter/material.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_button.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Constants/images.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            color: purpleColor,
            image: DecorationImage(
                image: AssetImage(onboarding_bgcircle),
                alignment: Alignment.topCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,top: 98,bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Haylo',
                    style: TextStyle(color: Colors.white, fontSize: 47),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: SizedBox(
                      height: screenHeight * 0.3,
                      child: Image.asset(onboarding_mainimg)),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Find Services',
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.1),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Endless Possibilities, Immediate Results',
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.04),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomButton(name: 'Get Started', task: () {
                  moveUTD(screen: const LoginView());
                }),
                Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Have an Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
