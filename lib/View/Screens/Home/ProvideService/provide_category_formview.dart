import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Home/ProvideService/provider_paymentform_view.dart';

import '../../../../Controller/Home/ProvideService/submit_alluserdata.dart';
import '../../../../Controller/controller_links.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';

class ProvideGategoryFormView extends StatelessWidget {
  const ProvideGategoryFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderCategoryFormController controller=Get.put( ProviderCategoryFormController());
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
                  text: 'Complete Your Business\n Profile',
                  fontColor: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.left),
              SizedBox(
                height: 30.h,
              ),

              //_____________________PROFILE IMAGE
              CircleAvatar(
                radius: 50.h,
                backgroundColor: grayColor,
                child: Image.asset(profileCircleImg),
              ),
              SizedBox(
                height: 10.h,
              ),
              MainTextWidget(
                  text: 'Upload Photo',
                  fontColor: const Color(0xFF373737),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  align: TextAlign.center),

              const MainForm(),
              CustomButton2(
                  name: 'Next',
                  task: () {
                 controller.goNext();
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommonBottomSings(
                    firsttext: 'Cannot find your service?',
                    lasttext: 'Click here',
                    navigate: const LoginView()),
              )
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
    Get.put(ProviderCategoryFormController());
    return GetBuilder<ProviderCategoryFormController>(builder: (controller) {
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
                text: 'Select Your Service Category',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 10.h,
            ),
            // CustomTextField(
            //     controller: controller.serviceNameCtrl,
            //     hintText: 'Select',
            //     abscr: false),
            CustomDropdownWidget(
                itemList: controller.serviceList,
                selectedItem: controller.selectedItem!,
                ),
            SizedBox(
              height: 20.h,
            ),
            MainTextWidget(
                text: 'Highlight Your Unique Skill',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
                controller: controller.uniqueSkillCtrl,
                hintText: 'Type Here',
                abscr: false),
            SizedBox(
              height: 20.h,
            ),
            MainTextWidget(
                text: 'Unique Pitch (What Makes You Stand Out In A Few Words?)',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: grayColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: controller.uniquePitch,
                maxLines:
                    null, // Setting maxLines to null allows the text to wrap to multiple lines
                keyboardType:
                    TextInputType.multiline, // Enables multiline input
                textInputAction: TextInputAction.newline,
                onSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                  hintText: 'Type Here',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 13.sp, color: Color(0xFF747474)),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  border: InputBorder.none,
                ),
                obscureText: false,
              ),
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


  CustomDropdownWidget(
      {required this.itemList, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderCategoryFormController>(
      builder: (controler){
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    value: selectedItem,
                    onChanged: (String? newValue) {
                   controler.changeSelectedItem(newValue);
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
