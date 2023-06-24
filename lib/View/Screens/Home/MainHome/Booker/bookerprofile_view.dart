import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/MainHome/Booker/booker_profile_controller.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Universal/notification_listview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_payment_updateview.dart';
import '../../../../Common Widgets/widgets_links.dart';
import '../../../../Constants/images.dart';
import '../../../../Constants/regix.dart';
import 'booker_bookings_listview.dart';

class BookerProfileView extends StatelessWidget {
  const BookerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(BookerProfileController());
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
                  height: 50.h,
                ),
                GestureDetector(
                  onTap: (){
                    LocalStorage().getToken();
                  },
                    child: Image.asset(profileImage)),
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: [
                  profileItemCard(
                      icon: Icons.person, name: 'Edit Profile', task: () {}),
                  profileItemCard(
                      icon: Icons.notification_important_outlined,
                      name: 'Notifications',
                      task: () {
                        moveUTD(
                            screen: NotificationListView(
                          role: 'booker',
                        ));
                      }),
                  profileItemCard(
                      icon: Icons.note_alt_outlined,
                      name: 'My Booking',
                      task: () {
                        moveUTD(screen: const BookerBookingListView() );
                      }),
                  profileItemCard(
                      icon: Icons.payment_rounded,
                      name: 'Payment Method',
                      task: () {
                        moveUTD(screen: const BookerPaymentUpdateView());
                      }),
                  profileItemCard(
                      icon: Icons.call,
                      name: 'Contact Us ',
                      task: () {
                        return MessageDialogue();
                      }),
                  profileItemCard(
                      icon: Icons.star_border_outlined,
                      name: 'Rate Us',
                      task: () {}),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(),
                  profileItemCard(
                      icon: Icons.logout,
                      name: 'Sign Out',
                      task: () {
                        controller.logoutUser();
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
      padding: EdgeInsets.only(top: 0.h),
      child: GestureDetector(
        onTap: () {
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
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontColor: Colors.black,
            align: TextAlign.start,
          ),
          trailing: name!='Sign Out' ? const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 20,
          ) : const SizedBox(),
        ),
      ),
    );
  }

  void MessageDialogue() {
    Get.defaultDialog(
      title: '',
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: 342.w,
        height: 565.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: MainTextWidget(
                  text: 'Contact Us',
                  fontColor: blackTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.h, bottom: 15.h, left: 30.w, right: 30.w),
              child: MainTextWidget(
                  text: 'Any question or remarks? just write us a message !',
                  fontColor: blackTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  align: TextAlign.center),
            ),
            MainTextWidget(
                text: 'Name',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
                controller: TextEditingController(),
                hintText: 'Type here',
                abscr: false,
              
                  error: 'field must be filled',
                  pattern: nameRegix,
                  
                ),
            SizedBox(
              height: 15.h,
            ),
            MainTextWidget(
                text: 'Email Address',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
                controller: TextEditingController(),
                hintText: 'Type here',
                abscr: false,
                  error: 'field must be filled',
                  pattern: nameRegix,
                  
                ),
            SizedBox(
              height: 15.h,
            ),
            MainTextWidget(
                text: 'Email Address',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            TextField(
              //controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Message',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: grayColor, width: 1.0, ),
                ),
              ),
            ),

             SizedBox(
              height: 20.h,
            ),

            CustomButton2(name: 'Send', task: (){Get.back();}),

             SizedBox(
              height: 20.h,
            ),

            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: SizedBox(
                width: double.infinity,
                child: MainTextWidget(
                    text: 'Cancel',
                    fontColor: blackTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    align: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      //insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
    );
  }
}
