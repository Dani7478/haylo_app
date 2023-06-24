import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackMoveJustIcon extends StatelessWidget {
  const BackMoveJustIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.topLeft,
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: context.height * 0.03,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black45,
                size: context.height * 0.05,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
