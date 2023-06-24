import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/Model/Booking.dart';
import 'package:haylo_app/View/Common%20Widgets/backmove_withtitle.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_home_view.dart';
import 'package:haylo_app/View/Screens/Universal/chat_list_view.dart';
import 'package:haylo_app/View/Screens/Universal/chatting_view.dart';
import '../../../../../Controller/Home/MainHome/Provider/provider_service_detail.dart';
import '../../../../Constants/images.dart';

class BookServiceDetailView extends StatelessWidget {
  BookServiceDetailView(
      {super.key, required this.bookDetail, required this.type});

  Booking bookDetail;
  String type;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderServiceDetailController());
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: type == 'booker' ? BottomButtonDesignBooker(
        book: bookDetail,) :
      bookDetail.status != 'Started'
          ? BottomButtonDesignProvider(book: bookDetail)
          : const SizedBox(),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackMoveAppBarWithTitle2(titleName: 'Booking Details'),
                const Divider(
                  thickness: 1.5,
                  color: dividerColor,
                ),
               type=='provider' ?  customerDetailCard(
                    bookDetail.userDetails!.profileImage!,
                    '${bookDetail.userDetails!.firstName} ${bookDetail
                        .userDetails!.lastName}',
                    bookDetail.status,'provider') :
               customerDetailCard(
                   bookDetail.providerDetails!.profileImage!,
                   '${bookDetail.providerDetails!.firstName} ${bookDetail
                       .providerDetails!.lastName}',
                   bookDetail.status,'booker')
                ,
                bookDetail.status == 'Started'
                    ? const TimeRemainingCard()
                    : SizedBox(),
                serviceNameCard(
                    bookDetail.serviceDetails!.image,
                    bookDetail.serviceDetails?.name,
                    bookDetail.serviceDetails?.description),
                bookDetail.immediatly == 1
                    ? bookImmediatelyCard('Booked Immediately',
                    'Booking Will Start Immediately When The Provider Will Accept')
                    : showBookedTime(
                    bookDetail.bookingDate!, bookDetail.bookingTime!),
                locationContainer(),
                bookDetail.status == 'Started' && type!='booker'
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 30),
                  child: CustomButtonWithIcon(
                      name: 'Mark As Complete',
                      task: () {
                        controller.bookedService('Completed', bookDetail.id!);
                      },
                      icon: Icons.check,
                      active: true),
                )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  customerDetailCard(image,
      name,
      status,
      type,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        MainTextWidget(
            text: 'Customer Details',
            fontColor: blackTextColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: double.infinity,
          height: 83.h,
          decoration: BoxDecoration(
              color: containerLightBlueClr,
              borderRadius: BorderRadius.circular(20.0)),
          child: InkWell(
            onTap: () {
              // Add your desired onTap functionality here
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 63,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainTextWidget(
                        text: name,
                        fontColor: blackTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        align: TextAlign.start,
                      ),
                      const SizedBox(height: 5.0),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: MainTextWidget(
                          text: status,
                          fontColor: status == 'Pending' || status=='Rejected'
                              ? statusRedColor
                              : purpleColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50.0,
                    width: 90.0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ChatCustomButton(
                        name: 'chat',
                        task: () {
                          // Add your desired onTap functionality here
                          moveRTL(screen:  ChatttingView());
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  serviceNameCard(image, serviceName, description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        MainTextWidget(
            text: 'Service Name',
            fontColor: blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: double.infinity,
          height: 83.h,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0)),
          child: InkWell(
            onTap: () {
              // Add your desired onTap functionality here
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 56,
                    width: 73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainTextWidget(
                        text: serviceName,
                        fontColor: blackTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        align: TextAlign.start,
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 250.h,
                        child: MainTextWidget(
                          text: description,
                          fontColor: descriptionTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          align: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  bookImmediatelyCard(title, subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        MainTextWidget(
            text: 'Booked Time',
            fontColor: blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            //height: 83.h,
            decoration: BoxDecoration(
              //  color: containerLightBlueClr,
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: SizedBox(
                // height: 73.w,
                // width: 56.h,
                child: Icon(
                  Icons.check_sharp,
                  size: 30.sp,
                  color: blackTextColor,
                ),
              ),
              title: MainTextWidget(
                  text: title.toString(),
                  fontColor: blackTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.start),
              subtitle: SizedBox(
                // height: 30,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget(
                      text: subtitle.toString(),
                      fontColor: grayTextClr,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      align: TextAlign.start),
                ),
              ),
            )),
      ],
    );
  }

  locationContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        MainTextWidget(
            text: 'Location',
            fontColor: blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            //color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: purpleColor)),
          child: Center(
            child: MainTextWidget(
                text: 'Map add here',
                fontColor: blackTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                align: TextAlign.start),
          ),
        ),
      ],
    );
  }

  showBookedTime(String date, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        MainTextWidget(
            text: 'Booking Time',
            fontColor: blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            align: TextAlign.start),
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_sharp,
                    size: 25,
                    color: purpleColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  MainTextWidget(
                      text: date,
                      fontColor: blackTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    size: 25,
                    color: purpleColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  MainTextWidget(
                      text: time,
                      fontColor: blackTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BottomButtonDesignProvider extends StatelessWidget {
  BottomButtonDesignProvider({Key? key, required this.book,}) : super(key: key);
  Booking book;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderServiceDetailController());
    if (book.status == 'Rejected') {
      return const SizedBox();
    } else if (book.status == 'Completed') {
      return const SizedBox();
    }
    else {
      return book.immediatly == 1 || book.status == 'Accepted'
          ? Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        height: 135.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.white,
              child: CustomButtonWithIcon(
                name: 'Start Service',
                task: () {
                  controller.bookedService('Started', book.id!);
                  //moveUTD(screen: const BookerHomeView());
                },
                active: true,
                icon: Icons.check,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              color: Colors.white,
              child: CustomButtonWithBorder(
                  name: 'Cancel Request',
                  task: () {
                    controller.bookedService('Rejected', book.id!);
                  }),
            ),
          ],
        ),
      )
          : Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        height: 135.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: CustomButtonWithIcon(
                  task: () {
                    controller.bookedService('Rejected', book.id!);
                  },
                  name: 'Descline',
                  icon: Icons.cancel_outlined,
                  active: false,
                )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: CustomButtonWithIcon(
                  task: () {
                    controller.bookedService('Accepted', book.id!);
                  },
                  name: 'Accepted',
                  icon: Icons.check,
                  active: true,
                )),
          ],
        ),
      );
    }
  }
}

class TimeRemainingCard extends StatelessWidget {
  const TimeRemainingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          MainTextWidget(
              text: 'Service Time',
              fontColor: blackTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              align: TextAlign.start),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              timeCard('Hour', 1),
              MainTextWidget(
                  text: ':',
                  fontColor: grayColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center),
              timeCard('Minutes', 12),
              MainTextWidget(
                  text: ':',
                  fontColor: grayColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center),
              timeCard('Seconds', 58),
            ],
          )
        ],
      ),
    );
  }

  timeCard(String name, int time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: containerLightBlueClr,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTextWidget(
              text: name,
              fontColor: grayColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.center),
          const SizedBox(height: 8),
          MainTextWidget(
              text: time.toString(),
              fontColor: blackTextColor,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              align: TextAlign.center),
        ],
      ),
    );
  }
}

class BottomButtonDesignBooker extends StatelessWidget {
  BottomButtonDesignBooker({Key? key, required this.book,}) : super(key: key);
  Booking book;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderServiceDetailController());
    if (book.status == 'Rejected') {
      return const SizedBox();
    } else if (book.status == 'Completed') {
      return GestureDetector(
          onTap: () {

          },
          child: Container(
              height: 51.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  whiteColor,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: purpleColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color:statusGreenColor,
                    size: 30,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    'Rate Your Service',
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        color: blackTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
          ));
    } else if(book.status=='Started'){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: CustomButtonWithIcon(
          task: (){},
          active: false,
          icon: Icons.chat_outlined,
          name: 'Chat With Provider',
        ),
      );
    }
    else {
      return book.status == 'Accepted' || book.status == 'Pending'
          ? Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        height: 135.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.white,
              child: CustomButtonWithIcon(
                name: 'Chat With Provider',
                task: () {

                  moveUTD(screen:  ChatttingView());
                },
                active: false,
                icon: Icons.chat_outlined,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                color: Colors.white,
                child: CustomButtonWithIcon(
                  name: 'Cancel Request',
                  active: true,
                  icon: Icons.cancel_outlined,
                  task: () {
                    controller.bookedService('Rejected', book.id!);
                  },
                )
            ),
          ],
        ),
      )
          : Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        height: 135.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: CustomButtonWithIcon(
                  task: () {
                    controller.bookedService('Rejected', book.id!);
                  },
                  name: 'Descline',
                  icon: Icons.cancel_outlined,
                  active: false,
                )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: CustomButtonWithIcon(
                  task: () {
                    controller.bookedService('Accepted', book.id!);
                  },
                  name: 'Accepted',
                  icon: Icons.check,
                  active: true,
                )),
          ],
        ),
      );
    }
  }
}
