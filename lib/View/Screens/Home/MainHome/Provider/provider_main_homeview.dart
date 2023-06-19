import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/book_service_detailview.dart';
import '../../../../Common Widgets/widgets_links.dart';

class ProviderMainHomeView extends StatelessWidget {
  const ProviderMainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderMainHomeController());
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 1.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                height: 70.h,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.w),
                    bottomLeft: Radius.circular(10.w),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.getAllBookingDeatail();
                      },
                      child: MainTextWidget(
                          text: 'Booking Started',
                          fontColor: whiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          align: TextAlign.start),
                    ),
                    // MainTextWidget(
                    //     text: '05:58:15',
                    //     fontColor: whiteColor,
                    //     fontSize: 14.sp,
                    //     fontWeight: FontWeight.w500,
                    //     align: TextAlign.start)
                    const HeaderTime(),
                  ],
                ),
              ),
              MainHomeTopAppBar(role: 'booker'),
              Padding(
                padding: EdgeInsets.all(15.0.w),
                child: const Divider(
                  color: dividerColor,
                  thickness: 1.3,
                ),
              ),
              const SelectionButtonSection(),
              SizedBox(
                height: 500.h,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          moveRTL(
                            screen: const BookServiceDetailView()
                          );
                        },
                        child: ProviderWorkCard(
                            image: profileImage,
                            name: 'Jhon Smith',
                            servicename: 'Serivce Name',
                            date: '5 july 2023',
                            time: '11:59 AM',
                            statusType: 'completed',
                            duration: '1 12 58'),
                      );
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class HeaderTime extends StatelessWidget {
  const HeaderTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        timeRemainSingleCard('H', '3'),
        SizedBox(width:2.w),
        MainTextWidget(
            text: ':',
            fontColor: whiteColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            align: TextAlign.center),
            SizedBox(width:2.w),
        timeRemainSingleCard('M', '58'),
          SizedBox(width:2.w),
        MainTextWidget(
            text: ':',
            fontColor: whiteColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            align: TextAlign.center),
           SizedBox(width:2.w),
        timeRemainSingleCard('S', '35'),
      ],
    );
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
              fontColor: purpleColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
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

class SelectionButtonSection extends StatelessWidget {
  const SelectionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderMainHomeController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
                child: controller.bookingtype == 'ongoing'
                    ? activeButton(
                        name: 'Ongoing Booking',
                        task: () {
                          controller.changeBooking(bookingtype: 'ongoing');
                        })
                    : inactiveButton(
                        name: 'Ongoing Booking',
                        task: () {
                          controller.changeBooking(bookingtype: 'ongoing');
                        })),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: controller.bookingtype == 'recent'
                    ? activeButton(
                        name: 'Recent Booking',
                        task: () {
                          controller.changeBooking(bookingtype: 'recent');
                        })
                    : inactiveButton(
                        name: 'Recent Booking',
                        task: () {
                          controller.changeBooking(bookingtype: 'recent');
                        })),
          ],
        ),
      );
    });
  }

  activeButton({String? name, Function? task}) {
    return GestureDetector(
        onTap: () {
          task!();
        },
        child: Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: purpleColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name!,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }

  inactiveButton({String? name, Function? task}) {
    return GestureDetector(
        onTap: () {
          task!();
        },
        child: Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: purpleColor, width: 1.5),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name!,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: purpleColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}
