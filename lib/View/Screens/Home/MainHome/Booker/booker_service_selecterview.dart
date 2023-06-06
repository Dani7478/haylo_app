import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerlocation_selectorview.dart';

import '../../../../Constants/images.dart';

class BookerServiceSelector extends StatelessWidget {
  const BookerServiceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackMoveAppBarWithTitle(
              titleName: 'Booking',
            ),
            const Divider(
              thickness: 2,
              color: dividerColor,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              child: MainTextWidget(
                  text: 'Selected Service',
                  fontColor: blackTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start),
            ),
            ServiceRateCard(
              role: 'user',
              image: serviceProviderImg,
              serviceName: 'Service Name',
              description: 'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
              serviceRate: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              child: MainTextWidget(
                  text: 'Select Date And Time',
                  fontColor: blackTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start),
            ),
            const Divider(
              thickness: 2,
              color: dividerColor,
            ),
            SizedBox(
              width: double.infinity,
              //  height: 100.h,
              child: MainTextWidget(
                  text: 'May 2023',
                  fontColor: blackTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.center),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 70.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return dateCard('Mon', (index + 1).toString(), '3');
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(
              thickness: 2,
              color: dividerColor,
            ),
             SizedBox(
              height: 20.h,
            ),
            
            SizedBox(
              height: 70.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return timeCard('${index + 1}:00 AM', '3:00 AM');
                  }),
            ),
            Spacer(),
            CustomButton2(
                name: 'Next',
                task: () {
                  moveUTD(screen: const BookerLocationSelectorView());
                }),
          ],
        ),
      ),
    );
  }

  dateCard(String day, String date, String selectedDate) {
    Color containerColor = whiteColor;
    if (date == selectedDate) {
      containerColor = purpleColor;
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 56.h,
      width: 46.w,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(15.sp)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTextWidget(
              text: day,
              fontColor: grayTextClr,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              align: TextAlign.center),
          SizedBox(
            height: 8.h,
          ),
          MainTextWidget(
              text: date,
              fontColor: grayTextClr,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              align: TextAlign.center),
        ],
      ),
    );
  }

  timeCard(String time, String selectedTime) {
    Color containerColor = whiteColor;
    if (time == selectedTime) {
      containerColor = purpleColor;
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 39.h,
      width: 80.w,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(15.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTextWidget(
              text: time,
              fontColor: grayTextClr,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              align: TextAlign.center),
        ],
      ),
    );
  }
}
