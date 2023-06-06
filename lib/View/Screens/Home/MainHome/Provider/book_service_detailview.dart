import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/backmove_withtitle.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_home_view.dart';
import 'package:haylo_app/View/Screens/Universal/chat_list_view.dart';

import '../../../../Constants/images.dart';

class BookServiceDetailView extends StatelessWidget {
  const BookServiceDetailView({super.key});

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
              child: CustomButton2(
                  name: 'Start Service',
                  task: () {
                    //moveUTD(screen: const BookerHomeView());
                  }),
            ),
            SizedBox(height: 10.h,),

             Container(
              color: Colors.white,
              child: CustomButtonWithBorder(
                  name: 'Cancel Request',
                  task: () {
                    moveUTD(screen: const ProviderHomeView());
                  }),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
          child: Column(
            children: [
              BackMoveAppBarWithTitle(titleName: 'Booking Detail'),
              const Divider(
                thickness: 1.5,
                color: dividerColor,
              ),
              customerDetailCard(profileImage, 'Joseph Ghotra', 'Accepted'),
              serviceNameCard(serviceProviderImg, 'service Name',
                  'Booking Will Start Immediately When The Provider Will Accept'),
              bookedDateCard('Booked Immediatly',
                  'Booking Will Start Immediately When The Provider Will Accept'),
              locationContainer()
            ],
          ),
        ),
      ),
    );
  }

  customerDetailCard(
    image,
    name,
    status,
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
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            height: 83.h,
            decoration: BoxDecoration(
                color: containerLightBlueClr,
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: SizedBox(
                height: 63.h,
                width: 63.h,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              title: MainTextWidget(
                  text: name,
                  fontColor: blackTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start),
              subtitle: SizedBox(
                height: 30,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget(
                      text: status,
                      fontColor: purpleColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      align: TextAlign.start),
                ),
              ),
              trailing: SizedBox(
                  width: 78.w,
                  child: ChatCustomButton(name: 'chat', task: () {
                   // moveRTL(screen: ChatListView(role: 'provider'));
                  })),
            )),
      ],
    );
  }

  serviceNameCard(image, servicename, description) {
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
            fontWeight: FontWeight.w400,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            //height: 83.h,
            decoration: BoxDecoration(
                //  color: containerLightBlueClr,
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: SizedBox(
                  height: 73.w,
                  width: 56.h,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
              title: MainTextWidget(
                  text: servicename,
                  fontColor: blackTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start),
              subtitle: SizedBox(
                // height: 30,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget(
                      text: description,
                      fontColor: grayTextClr,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      align: TextAlign.start),
                ),
              ),
            )),
      ],
    );
  }

  bookedDateCard(title, subtitle) {
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
            fontWeight: FontWeight.w400,
            align: TextAlign.start),
        SizedBox(
          height: 10.h,
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
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
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start),
              subtitle: SizedBox(
                // height: 30,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget(
                      text: subtitle.toString(),
                      fontColor: grayTextClr,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
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
            text: 'Loction',
            fontColor: blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
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
             border: Border.all(color: purpleColor)
          ),
          child:  Center(
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
}
