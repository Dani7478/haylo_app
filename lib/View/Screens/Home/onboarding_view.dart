import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_button.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Constants/images.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Screens/Home/signup_selection.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: Container(
          height: 130,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          decoration: BoxDecoration(
              color: purpleColor,
              border: Border.all(color: purpleColor, width: 0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  name: 'Get Started',
                  task: () {
                    moveUTD(screen: const LoginView());
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have an account?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  TextButton(
                      onPressed: () {
                        moveLTR(screen: const SignupSelectionView());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              )
            ],
          )),
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            color: purpleColor,
            image: DecorationImage(
                image: AssetImage(
                  onboardBg,
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: Padding(
            padding:
                EdgeInsets.only(left: 30.w, right: 30.w, top: 98.h, bottom: 25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Haylo',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 47,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: SizedBox(
                      height: screenHeight * 0.3,
                      child: Image.asset(onboardMainImg)),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Find Services',
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 44.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Endless Possibilities, Immediate Results',
                    style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 35.h),
                // CustomButton(name: 'Get Started', task: () {
                //   moveUTD(screen: const LoginView());
                // }),
                //  Spacer(),
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //   const  Text(
                //       'Dont Have an Account',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w200),
                //     ),
                //      TextButton(
                //               onPressed: () {
                //                 moveLTR(
                //                   screen:const SignupSelectionView()
                //                 );
                //               },
                //               child: const Text(
                //                 'Sign Up',
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w500),
                //               ))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.name, required this.task,});

  String name;
  Function task;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: (){
          task();
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  color: purpleColor,
                  fontWeight: FontWeight.w500
              ),

            ),
          ),
        ));
  }
}