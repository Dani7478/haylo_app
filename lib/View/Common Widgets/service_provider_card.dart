import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class ServiceProviderCard extends StatelessWidget {
  ServiceProviderCard(
      {super.key,
      required this.image,
      required this.rate,
      required this.description,
      required this.name,
      required this.star});
  String image;
  double star;
  String name;
  String description;
  int rate;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h),
        // height: 200,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: containerLightBlueClr,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: grayColor, borderRadius: BorderRadius.circular(12.0)),
              child: Image.asset(
              image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 230.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20.h,
                        color: greenIconClr,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      MainTextWidget(
                          text: '$star',
                          fontColor: textFieldTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          align: TextAlign.start)
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: name,
                      fontColor: textFieldTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: description,
                      fontColor: textFieldTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      align: TextAlign.start),
                  SizedBox(
                    height: 8.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: MainTextWidget(
                        text: 'Starting \$ $rate / Hour',
                        fontColor: purpleColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        align: TextAlign.end),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
