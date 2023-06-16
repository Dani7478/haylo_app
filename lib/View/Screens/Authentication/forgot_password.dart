import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Authentication/varification_code_view.dart';
import '../../Common Widgets/widgets_links.dart';
import 'package:get/get.dart';

import '../../Constants/images.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
   var controller= Get.put(ForgotPasswordController());

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.only(top: 28.h, left: 15, right: 15),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BackMoveAppBar(),
              SizedBox(
                height: 42.h,
              ),

              SizedBox(
                height: 135.h,
                width: 203.w,
                //color: Colors.purple,
                child: Image.asset(
                  forgotPasswordImg,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              //__________________MID TEXT
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      'Provide your account email for which you want \n to reset the password',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 13.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),

              //________________EMAIL SECTION
              EmailSection(height: screenHeight),

              SizedBox(
                height: 80.h,
              ),

              //_______________FORGOT BUTTON
             GetBuilder<ForgotPasswordController>(
               builder: (controller){
               return controller.isloading==false? CustomButton2(
                     name: 'Next',
                     task: () {
                       controller.sentCode();
                       //moveLTR(screen: const VarificationCodeView());
                     }): const CustomLoadingButton();
               },
             ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailSection extends StatelessWidget {
  EmailSection({Key? key, required this.height}) : super(key: key);
  double height;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ForgotPasswordController>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.05, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(text: 'Email Address'),
          SizedBox(
            height: height * 0.01,
          ),
          CustomTextField(
            controller: controller.emailCtrl,
            hintText: 'Enter Your Email',
            abscr: false,
            error: 'Please Enter valid email',
            pattern: emailRegix,
          ),
        ],
      ),
    );
  }
}
