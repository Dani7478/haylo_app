import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Common%20Widgets/functions.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Constants/images.dart';
import 'package:get/get.dart';

class BookerAddReview extends StatelessWidget {
  const BookerAddReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              BackMoveAppBarWithTitle(titleName: 'Submit Review'),
              SizedBox(height: 15.h),
              Divider(
                color: dividerColor,
                thickness: 2.0.sp,
              ),
              SizedBox(height: 45.h),
              SizedBox(
                height: 109.h,
                width: 109.w,
                child: Image.asset(
                  serviceProviderImg,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(height: 14.h),

              //__________________________provieder name
              MainTextWidget(
                  text: 'John Smith',
                  fontColor: blackTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  align: TextAlign.center),
              SizedBox(height: 5.h),

              //_________________________provider type

              MainTextWidget(
                  text: 'Service Name',
                  fontColor: purpleColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center),

              SizedBox(height: 37.h),

              //________________stars row
              ReviewStarSection(
                star: 4.5,
              ),

              SizedBox(height: 45.h),

              const MessageSection(),

              SizedBox(height: 45.h),

              CustomButton2(
                  name: 'Submit',
                  task: () {
                    //CustomFunctions().reviewDialogue();
                    // CustomFunctions().confirmationDialogue(
                    //     'Cancel Request',
                    //     'Are you sure. you want to cancel this request?',
                    //     'Yes',
                    //     'No',
                    //     () {},
                    //     () {Get.back();});
                    Map<String, dynamic> data = {
                      '${DateTime.now()}:': 'value',
                      'key2': 'value'
                    };
                    print(data);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewStarSection extends StatelessWidget {
  ReviewStarSection({super.key, required this.star});

  double star;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        starFunction(true),
        starFunction(true),
        starFunction(true),
        starFunction(true),
        starFunction(false),
        SizedBox(
          width: 15.w,
        ),
        MainTextWidget(
            text: star.toString(),
            fontColor: blackTextColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            align: TextAlign.center),
      ],
    );
  }

  starFunction(status) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: SizedBox(
          height: 29.h,
          width: 30.w,
          child: status == true
              ? Image.asset(starImg)
              : Image.asset(unfilStarImg)),
    );
  }
}

class MessageSection extends StatelessWidget {
  const MessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MainTextWidget(
              text: 'Write a review',
              fontColor: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.left),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          controller: TextEditingController(),
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Type Here',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: grayColor,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
