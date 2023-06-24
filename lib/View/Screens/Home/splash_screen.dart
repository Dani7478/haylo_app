import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/user.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerhome_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_home_view.dart';
import '../../Constants/images.dart';
import 'onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    whereMove();
    super.initState();
  }

  whereMove() async {
    int type=await LocalStorage().isUserSaved();

    if(type==1){
      Timer(const Duration(seconds: 3), () {
        moveUTD(screen: const BookerHomeView());
      });
    }
    else if(type==2){
      Timer(const Duration(seconds: 3), () {
        moveUTD(screen: const ProviderHomeView());
      });
    }else {

        Timer(const Duration(seconds: 3), () {
          moveUTD(screen: const OnboardingView());
        });

    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 85.h,
                width: 177.w,
                child: Image.asset(splashIm123),
              ),
              SizedBox(
                height: 15.h,
              ),
              MainTextWidget(
                  text: 'Help At Your Fingertips, Instantly',
                  fontColor: blackTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
