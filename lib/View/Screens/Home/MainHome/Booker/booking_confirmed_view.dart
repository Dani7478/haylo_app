import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Constants/images.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_main_homeview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerhome_view.dart';
import 'package:haylo_app/View/Screens/Universal/chatting_view.dart';

class BookerBookingConfirmed extends StatelessWidget {
  const BookerBookingConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
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
                    moveUTD(screen: const ChatttingView());
                  }),
            ),
            SizedBox(height: 15.h,),

             Container(
              color: Colors.white,
              child: CustomButton2(
                  name: 'Book to Home',
                  task: () {
                    moveUTD(screen: const BookerHomeView());
                  }),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 65.h),
          SizedBox(
            width: double.infinity,
            height: 25.h,
            child: MainTextWidget(
                text: 'Booking Confirmed',
                fontColor: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                align: TextAlign.center),
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
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
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
                        fontWeight: FontWeight.w500,
                        align: TextAlign.center),

                    SizedBox(
                      height: 10.h,
                    ),

                    MainTextWidget(
                        text:
                            'Please Find Below Important Details \nOf Your Booking.',
                        fontColor: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        align: TextAlign.center),

                    ServiceDetailCard(
                        name: 'Jhon Smith',
                        serviceName: 'Electrician',
                        date: '28 May 2020',
                        time: '08:59 AM'),

                    ServicePriceCard(rate: 60),
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
      padding: EdgeInsets.only(left: 25.w,right:25.w, top: 10.h),
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
                  fontWeight: FontWeight.w600,
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
    return Padding(
      padding: EdgeInsets.only(left: 25.w,right:25.w, top: 15.h),
      child: Card(
        color: lightGrayContainerClr,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            MainTextWidget(
                text: 'Service Card',
                fontColor: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
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
