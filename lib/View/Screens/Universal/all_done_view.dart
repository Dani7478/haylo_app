import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_home_view.dart';

import '../../Common Widgets/widgets_links.dart';
import '../../Constants/images.dart';

class PaymentDoneView extends StatelessWidget {
  PaymentDoneView({Key? key, required this.role}) : super(key: key);
  String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 70,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 205.h,
                    width: 172.w,
                    child: Image.asset(donePaymentImg),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  MainTextWidget(
                      text: 'All Set!',
                      fontColor: Colors.black,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.center),
                      SizedBox(
              height: 10.h,
            ),
                  MainTextWidget(
                      text: 'Your payment method added \n \n successfully.',
                      fontColor: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      align: TextAlign.center),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: CustomButton2(
              name: 'Go To Home',
              task: () {
                moveUTD(screen: whichWidget());
              },
            ),
          )
        ],
      ),
    );
  }

  whichWidget() {
    if (role == 'booker') {
      return const LoginView();
    } else {
      return const ProviderHomeView();
    }
  }
}
