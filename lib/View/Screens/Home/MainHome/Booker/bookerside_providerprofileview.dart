import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/uniquecategory_model.dart';
import 'package:haylo_app/Model/user_service.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_service_selecterview.dart';

import '../../../../Constants/images.dart';

class BookerSideProviderProfileView extends StatelessWidget {
  BookerSideProviderProfileView({super.key, required this.providerData});

  UniqueCategoryModel providerData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopProfileHeader(userdata: providerData),
          Container(
            //   width: double.infinity,
            height: 500.h,
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),

            color: whiteColor,
            child: ListView(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: dividerColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                MainTextWidget(
                    text: 'About Me',
                    fontColor: blackTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.start),
                SizedBox(
                  height: 10.h,
                ),
                MainTextWidget(
                    text:
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.',
                    fontColor: blackTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    align: TextAlign.justify),
                SizedBox(
                  height: 300.h,
                  child: ListView.builder(
                      itemCount: providerData.services?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            moveLTR(
                                screen: BookerServiceSelector(
                              category: providerData,
                              service: providerData.services![index],
                            ));
                          },
                          child: ServiceRateCard(
                            role: 'user',
                            service: providerData.services![index],
                          ),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopProfileHeader extends StatelessWidget {
  TopProfileHeader({super.key, required this.userdata});

  UniqueCategoryModel userdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              providerProfilebg,
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: Column(
          children: [
            BackMoveAppBarWithTitle2(titleName: ''),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: greenIconClr,
                              size: 20.sp,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: greenIconClr,
                              size: 20.sp,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: greenIconClr,
                              size: 20.sp,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: greenIconClr,
                              size: 20.sp,
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: greenIconClr,
                              size: 20.sp,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            MainTextWidget(
                                text: userdata.averageRating.toString(),
                                fontColor: blackTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                align: TextAlign.start)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    MainTextWidget(
                        text: '${userdata.firstName!} ${userdata.lastName!}',
                        fontColor: textFieldTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.start),
                    SizedBox(
                      height: 7.h,
                    ),
                    SizedBox(
                      width: 200,
                      child: MainTextWidget(
                          text: userdata.uniqueSkills!,
                          fontColor: descriptionTextColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.start),
                    ),
                  ],
                ),
                Container(
                  height: 130.h,
                  width: 130.h,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: containerLightBlueClr, width: 3)),
                  child: Image.network(
                    userdata.profileImage!,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
