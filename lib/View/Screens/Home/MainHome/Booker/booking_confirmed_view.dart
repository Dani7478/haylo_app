import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Constants/images.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_main_homeview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerhome_view.dart';
import 'package:haylo_app/View/Screens/Universal/chatting_view.dart';

import '../../../../../Controller/Home/MainHome/Booker/booker_confirmed_controller.dart';
import '../../../../../Model/service.dart';
import '../../../../../Model/uniquecategory_model.dart';

class BookerBookingConfirmed extends StatelessWidget {
  BookerBookingConfirmed({
    super.key,
    required this.service,
    required this.provider,
    required this.date,
    required this.time,
    required this.immediately,
  });

  UniqueCategoryModel provider;
  Services service;
  String date;
  String time;
  bool immediately;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerBookingConfirmConfirmed());
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        height: 135.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.white,
              child: ChatCustomButton(
                  name: 'Chat with Provider',
                  task: () {
                    moveUTD(screen:  ChatttingView());
                  }),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              color: Colors.white,
              child: CustomButton2(
                  name: 'Back to Home',
                  task: () {
                    controller.submitData(service, provider, date, time,immediately);
                    //  moveUTD(screen: const BookerHomeView());
                  }),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 70.h),
          SizedBox(
            width: double.infinity,
            height: 25.h,
            child: MainTextWidget(
                text: 'Booking Confirmed',
                fontColor: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                align: TextAlign.center),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                          color: containerShadowClr)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    //_____________divider
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
                      height: 32.h,
                    ),
                    //main image
                    SizedBox(
                      height: 136.h,
                      width: 186.w,
                      child: Image.asset(
                        bookingConfirmedMainImg,
                        fit: BoxFit.fill,
                      ),
                    ),

                    //thank u text
                    SizedBox(
                      height: 15.h,
                    ),

                    MainTextWidget(
                        text: 'Thank you for Confirm the Booking',
                        fontColor: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        align: TextAlign.center),

                    SizedBox(
                      height: 10.h,
                    ),

                    MainTextWidget(
                        text:
                            'Please Find Below Important Details \nOf Your Booking.',
                        fontColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        align: TextAlign.center),

                    ServiceDetailCard(
                        name: '${provider.firstName} ${provider.lastName}',
                        serviceName: service.name!,
                        date: date,
                        time: time),

                    ServicePriceCard(rate: service.perHourPrice!),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class ServicePriceCard extends StatelessWidget {
  ServicePriceCard({super.key, required this.rate});

  int rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
      child: Card(
        color: lightGrayContainerClr,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTextWidget(
                  text: 'Service Price',
                  fontColor: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center),
              MainTextWidget(
                  text: '\$ $rate / Hr',
                  fontColor: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.start)
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceDetailCard extends StatelessWidget {
  ServiceDetailCard(
      {super.key,
      required this.name,
      required this.serviceName,
      required this.date,
      required this.time});

  String name;
  String serviceName;
  String date;
  String time;

  @override
  Widget build(BuildContext context) {
    //Error month short................
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
      child: Card(
        color: lightGrayContainerClr,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            MainTextWidget(
                text: 'Service Details',
                fontColor: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                align: TextAlign.center),
            SizedBox(
              height: 20.h,
            ),
            serviceInnerCardRow('Provider Name', name),
            serviceInnerCardRow('Service Name', serviceName),
            serviceInnerCardRow('Date', date),
            serviceInnerCardRow('Time', time),
          ]),
        ),
      ),
    );
  }

  serviceInnerCardRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainTextWidget(
              text: title,
              fontColor: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center),
          MainTextWidget(
              text: value,
              fontColor: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.start)
        ],
      ),
    );
  }
}
