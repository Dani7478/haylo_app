import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/providerdetail_model.dart';
import 'package:haylo_app/Model/uniquecategory_model.dart';
import 'package:haylo_app/Model/user_service.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerlocation_selectorview.dart';
import '../../../../../Controller/controller_links.dart';
import '../../../../../Model/service.dart';
import '../../../../Constants/images.dart';

class BookerServiceSelector extends StatelessWidget {
  BookerServiceSelector(
      {super.key, required this.category, required this.service});

  UniqueCategoryModel category;
  Services service;

  @override
  Widget build(BuildContext context) {
    var controler = Get.put(BookerServiceSelectController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
        child: GetBuilder<BookerServiceSelectController>(builder: (controller) {
          return controler.isLoading == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackMoveAppBarWithTitle2(
                      titleName: 'Booking',
                    ),
                    const Divider(
                      thickness: 2,
                      color: dividerColor,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: MainTextWidget(
                          text: 'Selected Service',
                          fontColor: blackTextColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.start),
                    ),
                    ServiceRateCard(
                      role: 'user',
                      service: service,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: MainTextWidget(
                          text: 'Select Date And Time',
                          fontColor: blackTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.start),
                    ),
                    const Divider(
                      thickness: 2,
                      color: dividerColor,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      width: double.infinity,
                      //  height: 100.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controler.changeMonthIndex(type: '-');
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: blackTextColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MainTextWidget(
                              text: controler
                                  .monthsList[controller.monthSelectedIndex],
                              fontColor: blackTextColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              align: TextAlign.center),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              controler.changeMonthIndex(type: '+');
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: blackTextColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 70.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controler
                              .dateLists[controller.monthSelectedIndex].length,
                          itemBuilder: (context, index) {
                            String moth = controler
                                    .dateLists[controller.monthSelectedIndex]
                                [index];
                            String selectedMonth = controler
                                    .dateLists[controller.monthSelectedIndex]
                                [controller.selectedDateIndex];
                            return GestureDetector(
                                onTap: () {
                                  controler.changeDateIndex(index: index);
                                },
                                child: dateCard(moth, selectedMonth));
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
                      height: 39.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controler.timeList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controler.changeTimeIndex(index: index);
                              },
                              child: timeCard(
                                  controller.timeList[index],
                                  controller
                                      .timeList[controller.selectedTimeIndex]),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Switch(
                            value: controler.isImediatly,
                            activeColor: purpleColor,
                            inactiveThumbColor: const Color(0xFFA7A7A7),
                            inactiveTrackColor: const Color(0xFFD5D5D5),
                            onChanged: (value) {
                          controler.changeIsImmediately(value);
                        }),
                        MainTextWidget(
                            text: 'Book Immediately',
                            fontColor: blackTextColor,
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.bold,
                            align: TextAlign.left)
                      ],
                    ),
                    const Spacer(),
                    CustomButton2(
                        name: 'Next',
                        task: () {
                          controler.goNext(service, category);
                          //moveUTD(screen: const BookerLocationSelectorView());
                        }),
                  ],
                )
              : const LoadingView();
        }),
      ),
    );
  }

  dateCard(String date, String selectedDate) {
    var controller = Get.find<BookerServiceSelectController>();
    Color containerColor = whiteColor;
    if (date == selectedDate) {
      containerColor = purpleColor;
    }
    String dateName = date.split(' ')[0];
    String dayName = date.split(' ')[1];
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
              text: dateName,
              fontColor: grayTextClr,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              align: TextAlign.center),
          SizedBox(
            height: 8.h,
          ),
          MainTextWidget(
              text: dayName,
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
