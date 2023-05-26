import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/Authentication/forgotpassword_controller.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Authentication/varification_code_view.dart';
import '../../Common Widgets/common_text.dart';
import '../../Common Widgets/custom_button2.dart';
import '../../Common Widgets/custom_textfield.dart';
import '../../Common Widgets/responsive_calculator.dart';
import 'package:get/get.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Get.put(ForgotPasswordController());


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //_____________________TOP BACK ARROW
                SizedBox(
                  width: screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: screenHeight * 0.03,
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black45,
                              size: screenHeight * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //_____________________TOP HEADER IMAGE

                Container(
                  height: screenHeight * 0.3,
                  width: screenHeight * 0.3,
                  //color: Colors.purple,
                  child: Image.asset('assets/images/forgot-password.png', fit: BoxFit.fitWidth,),
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
                        fontSize: calculateFontSize(context, 24),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
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
                          fontSize: calculateFontSize(context, 13),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),

                //________________EMAIL SECTION
                Expanded(
                  child: EmailSection(height: screenHeight),
                ),

                //_______________FORGOT BUTTON
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 110),
                  child: CustomButton2(name: 'Next', task: () {
                    moveLTR(screen: const VarificationCodeView());
                  }),
                ),
              ],
            ),
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
          SizedBox(height: height * 0.01,),
          CustomTextField(
            controller: controller.emailCtrl,
            hintText: 'Enter Your Email',
            abscr: false,
          ),
        ],
      ),
    );
  }
}
