import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/consts.dart';

import '../../../../Constants/colors.dart';

class BookerChatListView extends StatelessWidget {
  const BookerChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 23.h,
            ),
            MainTextWidget(
                text: 'Chat',
                fontColor: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                align: TextAlign.center),
            SizedBox(
              height: 20.h,
            ),
            const Divider(
              thickness: 1.2,
              color: Color(0xFFE8E8E8),
            ),

            chatViewCard(
              name: 'Name 1 ',
              image: chatImage1,
              message: 'I just invited you and Jacob to dinner on Friday. You better be there',
              date: '5 Min ago'
            ),

            chatViewCard(
                name: 'Name 1 ',
                image: chatImage2,
                message: 'I just invited you and Jacob to dinner on Friday. You better be there',
                date: 'Yesterday'
            ),

            chatViewCard(
                name: 'Name 1 ',
                image: chatImage1,
                message: 'I just invited you and Jacob to dinner on Friday. You better be there',
                date: '23 May 2023'
            ),
          ],
        ),
      ),
    );
  }

  chatViewCard({String? image, String? name, String? message, String? date}) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: purpleColor,
                  child: Image.asset(image!, fit: BoxFit.fill,),
                ),
                 SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SizedBox(
                     width: 260.w,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween
                       ,
                       children: [
                         //person name
                         MainTextWidget(
                             text: name!,
                             fontColor: Colors.black,
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w500,
                             align: TextAlign.start),


                         //date
                         MainTextWidget(
                             text: date!,
                             fontColor: const Color(0xFFB1B1B1),
                             fontSize: 12.sp,
                             fontWeight: FontWeight.w300,
                             align: TextAlign.start),
                       ],
                     ),
                   ),
                     SizedBox(height: 8.h,),

                    SizedBox(
                      width: 250.w,
                      child: MainTextWidget(
                          text: 'I just invited you and Jacob to dinner on Friday. You better be there',
                          fontColor: const Color(0xFFB1B1B1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          align: TextAlign.start),
                    ),


                     Divider(
                      thickness: 1,
                      color: Colors.black
                    ),

                  ],
                )
              ],
            ),
      ),
    );

  }
}
