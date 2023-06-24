import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Home/BookService/bookservice_form_view.dart';
import 'package:haylo_app/View/Screens/Home/ProvideService/provideservice_form_view.dart';

class SignupSelectionView extends StatelessWidget {
  const SignupSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(bottom: 40.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text(
              'Already have an account?',
              style: TextStyle(
                  color: purpleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            TextButton(
                onPressed: () {
                  moveLTR(
                      screen:const LoginView()
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: context.height * 0.40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(onboardBg), fit: BoxFit.cover)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Positioned(
                      top: 50.h,
                      left: 50,
                      right: 50,
                      child: Column(
                        children: [
                          MainTextWidget(
                        text: 'Haylo',
                        fontColor: Colors.white,
                        fontSize: 47,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.center,
                      ),
                      
                      SizedBox(
                        width: 250.w,
                        height: 245.h,
                        child: Image.asset(
                          selectSignupMans,
                          fit: BoxFit.contain,
                        ),
                      ),
                      
                        ],
                      ))
                    // Positioned(
                    //   top: 59.h,
                    //   child: MainTextWidget(
                    //     text: 'Haylo',
                    //     fontColor: Colors.white,
                    //     fontSize: 47.sp,
                    //     fontWeight: FontWeight.w800,
                    //     align: TextAlign.center,
                    //   ),
                    // ),
                    // Positioned(
                    //   top: context.height * 0.15,
                    //   left: 0,
                    //   child: SizedBox(
                    //     width: 250.w,
                    //     height: 245.h,
                    //     child: Image.asset(
                    //       selectSignupMans,
                    //       fit: BoxFit.contain,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.70,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 80.h, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainTextWidget(
                        text: 'Hi, Nice To Meet You!',
                        fontColor: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.left,
                      ),
                      SizedBox(height: 10.h,),
                      MainTextWidget(
                        text: 'Continue as',
                        fontColor: const Color(0xFF373737),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.left,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      // Row(
                      //   children: [
                      //     Flexible(
                      //         fit: FlexFit.tight,
                      //
                      //         child: GestureDetector(
                      //           onTap: (){
                      //             moveUTD(screen: const BookServiceFormView());
                      //           },
                      //           child: SizedBox(
                      //               width: 164.w,
                      //               height: 166.h,
                      //               child: Image.asset(bookServiceImg)),
                      //         )),
                      //     SizedBox(
                      //       width: 8.w,
                      //     ),
                      //     GestureDetector(
                      //       onTap: (){
                      //         moveUTD(screen: const ProvideServiceFormView());
                      //       },
                      //       child: Flexible(
                      //           fit: FlexFit.tight,
                      //
                      //           child: SizedBox(
                      //               width: 164.w,
                      //               height: 166.h,
                      //               child: Image.asset(provideServiceImg))),
                      //     ),
                      //   ],
                      // ),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: [
                          GestureDetector(
                            onTap: () {
                              moveUTD(screen: const BookServiceFormView());
                            },
                            child: SizedBox(
                              width: 164.w,
                              height: 166.h,
                              child: Image.asset(bookServiceImg),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              moveUTD(screen: const ProvideServiceFormView());
                            },
                            child: SizedBox(
                              width: 164.w,
                              height: 166.h,
                              child: Image.asset(provideServiceImg),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 50.h,
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
