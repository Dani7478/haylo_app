import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/Model/Booking.dart';
import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class ProviderWorkCard extends StatelessWidget {
  ProviderWorkCard({
    super.key,
    required this.bookDetail,
  });

  Booking bookDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h, left: 8.0, right: 8.0),
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
                color: grayColor,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: NetworkImage(
                      bookDetail.userDetails!.profileImage.toString(),
                    ),
                    fit: BoxFit.cover),
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
                      text:
                          '${bookDetail.userDetails?.firstName} ${bookDetail.userDetails?.lastName}',
                      fontColor: textFieldTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.start),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: bookDetail.serviceDetails!.name.toString(),
                      fontColor: purpleColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
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
                          text: bookDetail.bookingDate!,
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
                          text: bookDetail.bookingTime!,
                          fontColor: grayTextClr,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.start),
                    ],
                  )
                ],
              ),
            ),
            bookDetail.status?.toLowerCase()=='started' || bookDetail.status?.toLowerCase()=='completed' ?
            //with time
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MainTextWidget(
                      text:bookDetail.status!.toLowerCase()=='started' ? 'On Going' : bookDetail.status!,
                      fontColor: bookDetail.status!.toLowerCase() == 'completed' ||
                          bookDetail.status!.toLowerCase() == 'started'
                          ? statusGreenColor
                          : bookDetail.status!.toLowerCase() == 'accepted' ||
                                  bookDetail.status!.toLowerCase() == 'approved'
                              ? purpleColor
                              : statusRedColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      align: TextAlign.start),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                          children: [
                            timeRemainSingleCard('H', '3'),
                            MainTextWidget(
                                text: ':',
                                fontColor: grayColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                align: TextAlign.center),
                            timeRemainSingleCard('M', '58'),
                            MainTextWidget(
                                text: ':',
                                fontColor: grayColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                align: TextAlign.center),
                            timeRemainSingleCard('S', '35'),
                          ],
                        ),


                ],
              ),
            ):
            //without time
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: MainTextWidget(
                      text:bookDetail.status!.toLowerCase()=='started' ? 'On Going' : bookDetail.status!,
                      fontColor: bookDetail.status!.toLowerCase() == 'completed' ||
                          bookDetail.status!.toLowerCase() == 'started'
                          ? statusGreenColor
                          : bookDetail.status!.toLowerCase() == 'accepted' ||
                          bookDetail.status!.toLowerCase() == 'approved'
                          ? purpleColor
                          : statusRedColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      align: TextAlign.start),
                ),
                const SizedBox(height: 50, width: 90,)
              ],
            )
          ],
        ));
  }

  String capitalizeFirstCharOfWords(String text) {
    final words = text.split(' ');

    for (int i = 0; i < words.length; i++) {
      words[i] = words[i].toUpperCase();
    }
    return text[0].toUpperCase();
    return words.join(' ');
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
