import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class ServiceRateCard extends StatelessWidget {
  ServiceRateCard(
      {super.key,
      required this.role,
      required this.image,
      required this.serviceName,
      required this.description,
      required this.serviceRate});
  String role;
  String image;
  String serviceName;
  String description;
  int serviceRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //  padding: EdgeInsets.only(left: 5.w, right: 5.w),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Center(
        child: ListTile(
          leading: SizedBox(
            height: 56.h,
            width: 73.w,
            child: Image.asset(provideService1),
          ),
          title: MainTextWidget(
            text: 'Service Name',
            fontSize: 12.sp,
            fontColor: Colors.black,
            fontWeight: FontWeight.w500,
            align: TextAlign.left,
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 3.h),
            // width: 200.w,
            child: MainTextWidget(
              text: 'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
              fontSize: 8.sp,
              fontColor: Colors.black,
              fontWeight: FontWeight.w300,
              align: TextAlign.start,
            ),
          ),
          trailing: SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 35.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grayColor,
                        // width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: MainTextWidget(
                        text: '\$ 30 /HR',
                        fontSize: 10.sp,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.left,
                      ),
                    )),
                SizedBox(
                  width: 5.w,
                ),
                role == 'admin'
                    ? const Icon(
                        Icons.delete,
                        color: purpleColor,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
