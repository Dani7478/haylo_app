import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import '../../../Constants/images.dart';

class BookServiceFormView extends StatelessWidget {
  const BookServiceFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookProfileFormController());
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 25.h, right: 25.h),
          child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              //___________________MAIN TEXT
              MainTextWidget(
                  text: 'Create Account',
                  fontColor: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.start),

              //________________Sub Text

              SizedBox(
                height: 5.h,
              ),

              MainTextWidget(
                  text: 'Connect with us today!',
                  fontColor: const Color(0xFF373737),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  align: TextAlign.start),

              SizedBox(
                height: 30.h,
              ),
              //_______________Profile Image
              CircleAvatar(
                radius: 50.h,
                backgroundColor: grayColor,
                child: Image.asset(profileCircleImg),
              ),

              SizedBox(
                height: 10.65.h,
              ),

              MainTextWidget(
                  text: 'Upload Photo',
                  fontColor: const Color(0xFF373737),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.center),

              //__________________________FIRST NAME CTRL
              CommonText(text: 'First Name'),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                controller: controller.firstNameCtrl,
                hintText: 'Enter Your First Name',
                abscr: false,
                error: 'Enter Something',
                pattern: nameRegix,
              ),

              SizedBox(
                height: 10.h,
              ),

              //__________________________LAST NAME
              CommonText(text: 'Last Name'),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                controller: controller.lastNameCtrl,
                hintText: 'Enter You Last Name',
                abscr: false,
                error: 'Enter Something',
                pattern: nameRegix,
              ),
              SizedBox(
                height: 10.h,
              ),

              //__________________________EMAIL
              CommonText(text: 'Email Address'),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                  controller: controller.emailCtrl,
                hintText: 'Enter Your Email',
                abscr: false,
                error: 'enter valid email',
                pattern: emailRegix,
              ),
              SizedBox(
                height: 10.h,
              ),

              //__________________________PASSWORD
              CommonText(text: 'Password'),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                controller: controller.passwordCtrl,
                hintText: 'Enter Your Password',
                abscr: true,
                error: 'Enter Valid Password',
                pattern: passwordRegix,
              ),

              //______________________TERMS COND
              //________________________________REMEMBER SECTION
              GetBuilder<BookProfileFormController>(
                init: BookProfileFormController(),
                builder: (controller) {
                  return Container(
                    transform:  Matrix4.translationValues(-9,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: controller.isTermsOk,
                                onChanged: (value) {
                                  controller.changedIsTermsOk();
                                }),
                            CommonText(text: 'I Agree To The Terms And Conditions'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              GetBuilder<BookProfileFormController>(builder: (controller) {
                return controller.isLoading==false ? CustomButton2(name: 'Sign Up', task: () {
                  controller.submitBooker();
                }):
                    const CustomLoadingButton();
              }),

              SizedBox(
                height: 8.h,
              ),
              OrSection(
                text: 'or sign Up with',
              ),
              const SocialSection(),
              CommonBottomSings(
                  firsttext: 'Already have an account',
                  lasttext: 'Sign In',
                  navigate: const LoginView()),
            ],
          ),
        ),
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
                image: facebookImg, buttonName: 'Facebook', task: () {}),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Expanded(
            child: CustomSocialButton(
                image: googleImg, buttonName: 'Google', task: () {}),
          ),
        ],
      ),
    );
  }
}
