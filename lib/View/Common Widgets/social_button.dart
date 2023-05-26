import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/colors.dart';

class CustomSocialButton extends StatelessWidget {
  CustomSocialButton(
      {super.key,
      required this.image,
      required this.buttonName,
      required this.task});

  String image;
  String buttonName;
  Function task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 51,
          decoration: BoxDecoration(
              border: Border.all(color: grayColor, width: 2),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 23,
                width: 23,
                child: Image.asset(image),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                buttonName,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }
}
