import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/booker_home_model.dart';
import '../../Model/service.dart';
import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class ServiceProviderCard extends StatelessWidget {
  ServiceProviderCard(
      {super.key,
      required this.recomendedService,
     });

  Services recomendedService;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h),
         height: 147,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: containerLightBlueClr,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          children: [
            Container(
              height: 97.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: grayColor, borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(
                    recomendedService.image!,
                  ),
                  fit: BoxFit.fill,
                )

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
                          text: '0',
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
                      text: recomendedService.name!,
                      fontColor: textFieldTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: recomendedService.description!,
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
                        text: 'Starting \$ ${recomendedService.perHourPrice} / Hour',
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
