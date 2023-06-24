import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Universal/chat_list_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_serachview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerprofile_view.dart';
import 'booker_main_homeview.dart';

class BookerHomeView extends StatelessWidget {
  const BookerHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerAppBarController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: GetBuilder<BookerAppBarController>(builder: (controller) {
          if (controller.activeView == 'profile') {
            return const BookerProfileView();
          } else if (controller.activeView == 'chat') {
            return  ChatListView(role: 'booker',);
          } else if (controller.activeView == 'search') {
            return const BookerSearchView();
          } else {
            return const BookerMainHomeView();
          }
        }),
        bottomNavigationBar: const BookerBottomNavBar(),
      ),
    );
  }
}

class BookerBottomNavBar extends StatelessWidget {
  const BookerBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerAppBarController());
    return GetBuilder<BookerAppBarController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: 63.h,
        decoration: BoxDecoration(
          color: whiteColor,
            boxShadow: [
              BoxShadow(
                  color: containerShadowClr,
                  blurRadius: 6.0.sp,
                  offset: const Offset(0, -3))
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomBarIcon(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  activeView: controller.activeView),
              bottomBarIcon(
                  icon: Icons.search,
                  text: 'Search',
                  activeView: controller.activeView),
              bottomBarIcon(
                  icon: Icons.message_outlined,
                  text: 'Chat',
                  activeView: controller.activeView),
              bottomBarIcon(
                  icon: Icons.person_2,
                  text: 'Profile',
                  activeView: controller.activeView),
            ],
          ),
        ),
      );
    });
  }

  bottomBarIcon({IconData? icon, String? text, String? activeView}) {
    late Color whichColor;
    Color activeColor = purpleColor;
    Color inactiveColor = Color(0xFFB1B1B1);
    if (text?.toLowerCase() == activeView?.toLowerCase()) {

      print('Calling');
      whichColor = purpleColor;
    } else {
      whichColor = inactiveColor;
    }
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.find<BookerAppBarController>().updateView(text.toLowerCase());
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: whichColor,
              size: 30.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            MainTextWidget(
                text: text!,
                fontColor: whichColor,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                align: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
