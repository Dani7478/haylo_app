import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Screens/Home/ProvideService/provider_paymentform_view2.dart';

import '../../../Common Widgets/widgets_links.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/regix.dart';
import '../../Authentication/login_view.dart';

class ProviderPaymentFormView extends StatelessWidget {
  const ProviderPaymentFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderPaymentFormController());
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
              SizedBox(
                height: 8.h,
              ),
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
    var controller = Get.put(ProviderPaymentFormController());
    return GetBuilder<ProviderPaymentFormController>(builder: (controller) {
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
              abscr: false,
              error: 'Enter valid phone no',
              pattern: phoneRegix,
            ),
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
              selectedItem: controller.selectedGender,
              type: 'gender',
            ),
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
              selectedItem: controller.selectedNationality,
              type: 'nationality',
            ),
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
              abscr: false,
              error: 'Enter Something',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 12.h,
            ),
            MainTextWidget(
                text: 'City',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: controller.cityCtrl,
              hintText: 'Type Here',
              abscr: false,
              error: 'Enter Something',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 12.h,
            ),
            MainTextWidget(
                text: 'Address',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: controller.addressCtrl,
              hintText: 'Type Here',
              abscr: false,
              error: 'Enter Something',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 12.h,
            ),
            MainTextWidget(
                text: 'Postal code',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: controller.postalCtrl,
              hintText: 'Type Here',
              abscr: false,
              error: 'Enter Something',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 12.h,
            ),
            MainTextWidget(
                text: 'National Id /SSN',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: controller.nationalIdCtrl,
              hintText: 'Type Here',
              abscr: false,
              error: 'Enter Something',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      );
    });
  }
}

class CustomDropdownWidget extends StatelessWidget {
  List<String> itemList;
  String selectedItem;
  String type;

  CustomDropdownWidget(
      {required this.itemList, required this.selectedItem, required this.type});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderPaymentFormController>(
      builder: (controler) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: grayColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: selectedItem,
                      onChanged: (String? newValue) {
                        if (type == 'gender') {
                          controler.changeGender(gneder: newValue.toString());
                        } else {
                          controler.changeNationality(
                              nationality: newValue.toString());
                        }
                      },
                      items: itemList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                color: Color(0xFF747474),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      icon: SizedBox.shrink(),
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: blackTextColor,
                  size: 25.sp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
