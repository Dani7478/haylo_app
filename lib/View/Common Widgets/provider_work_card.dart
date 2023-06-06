import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class ProviderWorkCard extends StatelessWidget {
  ProviderWorkCard({
    super.key,
    required this.image,
    required this.name,
    required this.servicename,
    required this.date,
    required this.time,
    required this.statusType,
    required this.duration,
  });
  String image;
  String name;
  String servicename;
  String date;
  String time;
  String statusType;
  String duration;

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
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
             // color: Colors.green,
              width: 160.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: name,
                      fontColor: textFieldTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      align: TextAlign.start),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: servicename,
                      fontColor: purpleColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      align: TextAlign.start),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: grayTextClr,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MainTextWidget(
                          text: date,
                          fontColor: grayTextClr,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.start),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled_sharp,
                        size: 20,
                        color: grayTextClr,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MainTextWidget(
                          text: date,
                          fontColor: grayTextClr,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.start),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MainTextWidget(
                      text: statusType,
                      fontColor: statusType == 'accepted'
                          ? purpleColor
                          : statusType == 'pending'
                              ? statusRedColor
                              : statusType == 'rejected'
                                  ? statusRedColor
                                  : statusGreenColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      align: TextAlign.start),
                      SizedBox(height: 10.h,),
                  Row(
                    children: [
                      timeRemainSingleCard('H', '3'),
                      MainTextWidget(
                          text: ':',
                          fontColor: whiteColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.center),
                      timeRemainSingleCard('M', '58'),
                       MainTextWidget(
                          text: ':',
                          fontColor: whiteColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.center),
                      timeRemainSingleCard('S', '35'),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  timeRemainSingleCard(String chr, String time) {
    return Container(
      height: 31.h,
      width: 28.w,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTextWidget(
              text: chr,
              fontColor: grayTextClr,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center),
          MainTextWidget(
              text: time,
              fontColor: blackTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center)
        ],
      ),
    );
  }
}
