import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/booker_home_model.dart';
import '../../Model/service.dart';
import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class RecommendedSeriveCard extends StatelessWidget {
  RecommendedSeriveCard(
      {super.key,
        required this.recommendedService,
      });

  Services recommendedService;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h),
       // height: 147,
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
                      recommendedService.image!,
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
                        size: 15.h,
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
                  const SizedBox(height: 8.5,),
                  Row(
                    children: [
                     Container(
                       height: 21,
                       width: 21,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(90),
                           image: DecorationImage(
                             image: NetworkImage(
                               recommendedService.providerDetails!.profileImage!,
                             ),
                             fit: BoxFit.fill,
                           )
                       ),
                     ),
                      SizedBox(
                        width: 4.w,
                      ),
                      MainTextWidget(
                          text: '${recommendedService.providerDetails!.firstName} ${recommendedService.providerDetails?.lastName}',
                          fontColor: blackTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          align: TextAlign.start),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: recommendedService.name!,
                      fontColor: purpleColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      align: TextAlign.start),
                  SizedBox(
                    height: 2.h,
                  ),
                  MainTextWidget(
                      text: recommendedService.description!,
                      fontColor: descriptionTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      align: TextAlign.start),
                  SizedBox(
                    height: 8.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: MainTextWidget(
                        text: '\$ ${recommendedService.perHourPrice} / Hour',
                        fontColor: purpleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        align: TextAlign.end),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
