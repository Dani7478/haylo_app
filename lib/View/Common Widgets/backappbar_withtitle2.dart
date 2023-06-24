import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/colors.dart';

class BackMoveAppBarWithTitle2 extends StatelessWidget {
  BackMoveAppBarWithTitle2({Key? key, required this.titleName}) : super(key: key);
  String titleName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleAvatar(
                   // backgroundColor: Colors.grey[300],
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
            ),
            Expanded(
              flex: 60,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: MainTextWidget(
                      text: titleName,
                      fontColor: blackTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.start)),
            ),
          ],
        ));
  }
}


