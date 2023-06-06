import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/backmove_withtitle.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Constants/consts.dart';

class NotificationListView extends StatelessWidget {
   NotificationListView({super.key, required this.role});
  String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: BackMoveAppBarWithTitle(titleName: 'Notification'),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return NotificationCard(
                      message:
                          'Your Booking Has Been Completed Click Here To Release Payment To Your Provider',
                          image: chatImage1,
                          duration: 'Today',
                          senderName: 'Jhon Smith',
                          dateTime: '23 May 2023',
                    );
                  }))
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  NotificationCard({
    super.key,
    required this.duration,
    required this.image,
    required this.message,
    required this.senderName,
    required this.dateTime,
  });
  String duration;
  String image;
  String message;
  String senderName;
  String dateTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            // height: 30.h,
            width: double.infinity,
            color: notificationTopHeaderClr,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: MainTextWidget(
                  text: duration,
                  fontColor: blackTextColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
            child: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: purpleColor,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: MainTextWidget(
                            text:
                                message,
                            fontColor: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            align: TextAlign.start),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        width: 270.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //person name
                            MainTextWidget(
                                text: 'senderName',
                                fontColor: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                align: TextAlign.start),

                            //date
                            MainTextWidget(
                                text: dateTime,
                                fontColor: const Color(0xFFB1B1B1),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                                align: TextAlign.start),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
