import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';

import '../../../../Constants/images.dart';

class BookerProfileView extends StatelessWidget {
  const BookerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: ListView(
        children: [
          Container(
            height: context.height * 0.30.h,
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Image.asset(profileImage),
                SizedBox(
                  height: 10.h,
                ),
                MainTextWidget(
                    text: 'Joseph Ghotra',
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    align: TextAlign.center)
              ],
            ),
          ),
          Container(
            height: context.height * 0.50.h,

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: [
                  profileItemCard(icon: Icons.person, name: 'Profile', task: (){}),
                  profileItemCard(icon: Icons.notification_important_outlined, name: 'Notification', task: (){}),
                  profileItemCard(icon: Icons.note_alt_outlined, name: 'My Booking', task: (){}),
                  profileItemCard(icon: Icons.payment_rounded, name: 'Payment Method', task: (){}),
                  profileItemCard(icon: Icons.call, name: 'Contact Us', task: (){}),
                  profileItemCard(icon: Icons.star_border_outlined, name: 'Rate Us', task: (){}),
                  SizedBox(height: 15.h,),
                  const Divider(),
                  profileItemCard(icon: Icons.logout, name: 'Sign Out', task: (){
                    moveUTD(screen: const LoginView());
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  profileItemCard({String? name, IconData? icon, Function? task}) {
    return Padding(
      padding:  EdgeInsets.only(top: 0.h),
      child: GestureDetector(
        onTap: (){
          task!();
        },
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
            size: 25.sp,
          ),
          title: MainTextWidget(
            text: name!,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontColor: Colors.black,
            align: TextAlign.start,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
             size: 20,
          )
          ,
        ),
      ),
    );
  }
}
