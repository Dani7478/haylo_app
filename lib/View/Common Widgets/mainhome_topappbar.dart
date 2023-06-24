import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/MainHome/Provider/provider_mainhome_controller.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Screens/Universal/notification_listview.dart';

import '../Constants/colors.dart';
import '../Constants/images.dart';

class MainHomeTopAppBar extends StatelessWidget {
  MainHomeTopAppBar({super.key, required this.role});
  String role;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h, bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            child: Image.asset(
              profileImage,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(child: GetBuilder<ProviderMainHomeController>(
            init: ProviderMainHomeController(),
            builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainTextWidget(
                    text: 'Haylo',
                    fontColor: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.start),
                SizedBox(
                  height: 3.h,
                ),
                MainTextWidget(
                    text: controller.date,
                    fontColor: grayColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.start),
              ],
            );
          })),
          Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
                color: containerLightBlueClr,
                borderRadius: BorderRadius.circular(8.0),
                // boxShadow: [
                //   BoxShadow(
                //       color: containerShadowClr,
                //       blurRadius: 6.0.sp,
                //       offset: const Offset(0, 0))
                // ]
            ),
            child: GestureDetector(
              onTap: () {
                moveUTD(
                    screen: NotificationListView(
                  role: role,
                ));
              },
              child: const Center(
                child: Icon(
                  Icons.notifications_outlined,
                  color: purpleColor,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
