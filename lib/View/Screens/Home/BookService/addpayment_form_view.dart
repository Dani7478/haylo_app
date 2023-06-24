import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/View/Common%20Widgets/backmover_circular.dart';
import 'package:haylo_app/View/Common%20Widgets/custom_button2.dart';
import 'package:haylo_app/View/Common%20Widgets/customfield_bottomBorder.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Universal/all_done_view.dart';
import '../../../Constants/images.dart';

class BookerAddPaymentFormView extends StatelessWidget {
  const BookerAddPaymentFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddPaymentController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 26, left: 15, right: 15, ),
        child: ListView(
          children: [
            const BackMoveAppBar(),
            SizedBox(
              height: 28.h,
            ),
            MainTextWidget(
                text: 'Add Payment Method',
                fontColor: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                align: TextAlign.left),
                SizedBox(
              height: 5.h,
            ),
            MainTextWidget(
                text: 'Provide your payment details',
                fontColor: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                align: TextAlign.left),

            Container(
              width: 308.w,
              height: 195.h,
              padding: EdgeInsets.only(top: 41.h),
              child: Image.asset(addPaymentImg),
            ),
            SizedBox(height: 30.h,),
            CustomFieldWithBottomBorder(
                title: 'Name on Card',
                hint: 'Maria',
                abscr: false,
                controller: controller.cardNameCtrl,
              endicon: Icons.person,),

            CustomFieldWithBottomBorder(
                title: 'Card Number',
                hint: '**** **** **** ****',
                abscr: true,
                controller: controller.cardNumberCtrl,
              endicon: Icons.credit_card,),

            Row(
              children: [
                Expanded(
                  child: CustomFieldWithBottomBorder(
                      title: 'Expiry Date',
                      hint: '22/6/2025',
                      abscr: false,
                      controller: controller.cardDateCtrl,
                    endicon: Icons.date_range_sharp,
                  ),
                ),
                 SizedBox(width: 12.w,),
                Expanded(
                  child: CustomFieldWithBottomBorder(
                      title: 'CVV',
                      hint: '000',
                      abscr: false,
                      controller: controller.cvvCtrl,
                    endicon: Icons.lock,),
                ),

              ],
            ),
            SizedBox(height: 80.h,),
            CustomButton2(name: 'Add Card', task: () {
              moveRTL(screen:  PaymentDoneView(role: 'booker',));
            }),
          ],
        ),
      ),
    );
  }
}
