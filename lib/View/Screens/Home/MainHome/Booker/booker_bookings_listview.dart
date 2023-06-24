import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/Model/Booking.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_providerwork.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/book_service_detailview.dart';
import '../../../../../Controller/Home/MainHome/Booker/booker_booking_listcontroller.dart';
import '../../../../Common Widgets/widgets_links.dart';

class BookerBookingListView extends StatelessWidget {
  const BookerBookingListView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerBookingListController());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshData,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
                children: [
              Column(
                children: [
                  const SizedBox(height: 25,),
                 BackMoveAppBarWithTitle2(titleName: 'My Bookings'),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: dividerColor,
                      thickness: 1.3,
                    ),
                  ),
                  const SelectionButtonSection(),
                  GetBuilder<BookerBookingListController>(builder: (cont) {
                    return SizedBox(
                      height: 500.h,
                      child: cont.dataLoading == true
                          ? const LoadingView()
                          : ListView.builder(
                          itemCount: cont.bookingType == 'ongoing'
                              ? cont.bookingList.length
                              : cont.historyBooking.length,
                          itemBuilder: (context, index) {
                            Booking singleBooking =
                            cont.bookingType == 'ongoing'
                                ? cont.bookingList[index]
                                : cont.historyBooking[index];
                            return GestureDetector(
                              onTap: () {
                                moveRTL(
                                  screen: BookServiceDetailView(
                                    bookDetail: singleBooking,
                                    type:'booker',
                                  ),
                                );
                              },
                              child: BookerProviderWorkCard(
                                  bookDetail: singleBooking),
                            );
                          }),
                    );
                  }),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}



class SelectionButtonSection extends StatelessWidget {
  const SelectionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookerBookingListController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
                child: controller.bookingType == 'ongoing'
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
                child: controller.bookingType == 'history'
                    ? activeButton(
                    name: 'My Booking',
                    task: () {
                      controller.changeBooking(bookingtype: 'history');
                    })
                    : inactiveButton(
                    name: 'My Booking',
                    task: () {
                      controller.changeBooking(bookingtype: 'history');
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
          height: 42.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: purpleColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name!,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
          height: 42.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: grayColor, width: 1),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              name!,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: blackTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
