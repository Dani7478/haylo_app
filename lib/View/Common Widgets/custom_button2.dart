import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/colors.dart';

// ignore: must_be_immutable
class CustomButton2 extends StatelessWidget {
  CustomButton2({super.key, required this.name, required this.task,});

  String name;
  Function task;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
       onTap: (){
         task();
       },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: purpleColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name,
              style:  GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400
              ),
            
            ),
          ),
        ));
  }
}
