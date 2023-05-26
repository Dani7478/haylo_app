import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/Authentication/forgotpassword_controller.dart';
import '../../Common Widgets/common_text.dart';
import '../../Common Widgets/custom_button2.dart';
import '../../Common Widgets/custom_textfield.dart';
import '../../Common Widgets/responsive_calculator.dart';
import 'package:get/get.dart';

import '../../Common Widgets/varificationcode_input.dart';


class VarificationCodeView extends StatelessWidget {
  const VarificationCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


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
                      'Enter Verification Code',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 24,
                        //fontSize: calculateFontSize(context, 24),
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
                        'Enter the verification code we sent to\n johnmichel00@gmail.com',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          //fontSize: calculateFontSize(context, 13),
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),

                //________________EMAIL SECTION
                Expanded(
                  child: VarificationSection(height: screenHeight),
                ),

                //_______________FORGOT BUTTON
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: screenHeight*0.1),
                  child:Column(
                    children: [
                      const  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Time Remaining',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 8,),
                          Text(
                            ': 30 Sec',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      CustomButton2(name: 'Next', task: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class VarificationSection extends StatelessWidget {
  VarificationSection({Key? key, required this.height}) : super(key: key);
  double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.05, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerificationCodeInput(),
          // VerificationCode(
          //   textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
          //   keyboardType: TextInputType.number,
          //   underlineColor: Colors.amber, // If this is null it will use primaryColor: Colors.red from Theme
          //   length: 4,
          //   cursorColor: Colors.blue, // If this is null it will default to the ambient
          //   // clearAll is NOT required, you can delete it
          //   // takes any widget, so you can implement your design
          //   clearAll: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       'clear all',
          //       style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue[700]),
          //     ),
          //   ),
          //   onCompleted: (String value) {
          //     // setState(() {
          //     //   _code = value;
          //     // });
          //   },
          //   onEditing: (bool value) {
          //     // setState(() {
          //     //   _onEditing = value;
          //     // });
          //     // if (!_onEditing) FocusScope.of(context).unfocus();
          //   },
          // ),
        ],
      ),
    );
  }
}
