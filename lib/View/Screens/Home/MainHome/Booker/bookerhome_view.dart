import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_chatlist_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_serachview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerprofile_view.dart';

class BookerHomeView extends StatelessWidget {
  const BookerHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var controller= Get.put(BookerAppBarController());
    return Scaffold(
      body: GetBuilder<BookerAppBarController>(
          builder: (controller) {
            if (controller.activeView == 'profile') {
              return const BookerProfileView();
            } else if (controller.activeView == 'chat') {
              return const BookerChatListView();
            } else if (controller.activeView == 'search') {
              return const BookerSearchView();
            } else {
              return Center(
                child: MainTextWidget(text: 'Home',
                    fontColor: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center),
              );
            }
          }
      ),
      bottomNavigationBar: BookerBottomNavBar(),
    );
  }
}

class BookerBottomNavBar extends StatelessWidget {
  const BookerBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerAppBarController());
    return GetBuilder<BookerAppBarController>(
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: 63.h,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  bottomBarIcon(icon: Icons.home,
                      text: 'Home',
                      activeView: controller.activeView),
                  bottomBarIcon(icon: Icons.search,
                      text: 'Search',
                      activeView: controller.activeView),
                  bottomBarIcon(icon: Icons.chat_bubble_outline,
                      text: 'Chat',
                      activeView: controller.activeView),
                  bottomBarIcon(icon: Icons.person,
                      text: 'Profile',
                      activeView: controller.activeView),
                ],
              ),
            ),
          );
        }

    );
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
    return GestureDetector(
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
          SizedBox(height: 5.h,),
          MainTextWidget(
              text: text!,
              fontColor: whichColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center)
        ],
      ),
    );
  }
}
