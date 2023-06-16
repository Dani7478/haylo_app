import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Screens/Home/ProvideService/provider_addnewservice_view.dart';

import '../../../Common Widgets/widgets_links.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/regix.dart';
import '../../Authentication/login_view.dart';

class ProviderPaymentFormView2 extends StatelessWidget {
  const ProviderPaymentFormView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderPaymentFormController2());
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            children: [
              SizedBox(
                height: 24.h,
              ),
              //______________APPBAR
              const BackMoveAppBar(),
              SizedBox(
                height: 28.h,
              ),

              //______________MAIN TEXT
              MainTextWidget(
                  text: 'Add Your Payment Detail',
                  fontColor: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.left),

              SizedBox(height: 8.h),
              MainTextWidget(
                  text:
                      'This details will require to make your stripe \nconnect account',
                  fontColor: const Color(0xFF373737),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.left),

              SizedBox(
                height: 30.h,
              ),

              //_____________________PROFILE IMAGE

              const MainForm(),
              CustomButton2(
                  name: 'Next',
                  task: () {
                   controller.goNext();
                  }),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainForm extends StatelessWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderPaymentFormController2());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          MainTextWidget(
              text: 'Bank Account Holder Name',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),

          CustomTextField(
              controller: controller.holderNameCtrl,
              hintText: 'Type here',
              abscr: false,
               error: 'Enter Something',
                  pattern: nameRegix,
              ),
              
          SizedBox(
            height: 12.h,
          ),
          MainTextWidget(
              text: 'Routing Number',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.routingNumberCtrl,
              hintText: 'Type Here',
              abscr: false,
               error: 'Enter Something',
                  pattern: nameRegix,
              ),
          SizedBox(
            height: 12.h,
          ),
          MainTextWidget(
              text: 'Bank Name',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.bankNameCtrl,
              hintText: 'Type Here',
              abscr: false,
               error: 'Enter Something',
                  pattern: nameRegix,
              ),
          SizedBox(
            height: 12.h,
          ),
          MainTextWidget(
              text: 'Bank Account Number',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.bankAccountNumberCtrl,
              hintText: 'Type Here',
              abscr: false,
               error: 'Enter Valid Bank Account',
                  pattern: cardNoRegix,
              ),
          SizedBox(
            height: 12.h,
          ),
          MainTextWidget(
              text: 'Incorporation Date',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.incorporationCtrl,
              hintText: 'DD/MM/YY',
              abscr: false,
               error: 'Enter Something',
                  pattern: dateRegix,
              ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
