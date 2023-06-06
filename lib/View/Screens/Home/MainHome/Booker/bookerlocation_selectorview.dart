import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Common%20Widgets/backmove_withtitle.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_button2.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booking_confirmed_view.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import '../../../../Constants/styles.dart';

class BookerLocationSelectorView extends StatelessWidget {
  const BookerLocationSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: CustomButton2(name: 'Select Location', task: (){
          moveUTD(screen: const BookerBookingConfirmed());
        }),
      ),

      floatingActionButton: CircleAvatar(
        radius: 30.0.h,
        backgroundColor: Colors.white,
        child: Icon(Icons.add_circle_outline_outlined, color: purpleColor, size: 30.h,),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned.fill(
              top: 0,
              left: 0,
              child: Container(
                height: 1000,
                width: context.width,
                //color: Colors.blueAccent,
                child:  Center(child: Image.asset(mapssImg)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackMoveAppBarWithTitle(
                    titleName: 'Location',
                  ),
                  SizedBox(height: 20.h),
                  SearchBar(),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}



class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerLocationController());

    return Container(
        height: 47.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow:  const [
            BoxShadow(
              color: containerShadowClr,
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 2), // Offset to apply shadow at the top
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: grayIconsColor,
                size: 30,
              ),
              SizedBox(
                width: 250.w,
                child: TextField(
                  controller: controller.locationCtrl,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: CustomTextStyles().hinttextstyle,
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  style: CustomTextStyles().textFieldmainText,
                ),
              )
            ],
          ),
        ));
  }
}