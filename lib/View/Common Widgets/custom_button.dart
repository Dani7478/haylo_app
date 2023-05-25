import 'package:flutter/material.dart';
import 'package:haylo_app/View/Constants/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.name, required this.task});

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
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                color: purpleColor,
                fontWeight: FontWeight.w400
              ),
            
            ),
          ),
        ));
  }
}
