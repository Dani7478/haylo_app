import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Screens/Home/ProvideService/provider_paymentform_view2.dart';

import '../../../Common Widgets/widgets_links.dart';
import '../../../Constants/colors.dart';
import '../../Authentication/login_view.dart';

class ProviderPaymentFormView extends StatelessWidget {
  const ProviderPaymentFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderCategoryFormController());
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
              CustomButton2(name: 'Next', task: () {
                moveUTD(screen: const ProviderPaymentFormView2());
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
    var controller = Get.put(ProviderPaymentFormController());
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
              text: 'Phone Number',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.phonNoCtrl,
              hintText: 'Type here',
              abscr: false),
          SizedBox(
            height: 12.h,
          ),
          MainTextWidget(
              text: 'Gender',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomDropdownWidget(
              itemList: controller.genderList,
              selectedItem: controller.selectedGender),
          SizedBox(
            height: 12.h,
          ),
          MainTextWidget(
              text: 'Select Nationality',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomDropdownWidget(
              itemList: controller.nationalityList,
              selectedItem: controller.selectedNationality),
          SizedBox(
            height: 12.h,
          ),


          MainTextWidget(
              text: 'State',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.stateCtrl,
              hintText: 'Type Here',
              abscr: false),
          SizedBox(
            height: 12.h,
          ),


          MainTextWidget(
              text: 'State',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.stateCtrl,
              hintText: 'Type Here',
              abscr: false),
          SizedBox(
            height: 12.h,
          ),

          MainTextWidget(
              text: 'State',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.stateCtrl,
              hintText: 'Type Here',
              abscr: false),
          SizedBox(
            height: 12.h,
          ),

          MainTextWidget(
              text: 'State',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.stateCtrl,
              hintText: 'Type Here',
              abscr: false),
          SizedBox(
            height: 12.h,
          ),

          MainTextWidget(
              text: 'State',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
              controller: controller.stateCtrl,
              hintText: 'Type Here',
              abscr: false),
          SizedBox(
            height: 20.h,
          ),

        ],
      ),
    );
  }
}
