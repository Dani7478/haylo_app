import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/backmove_appbar.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';

import '../../../../Controller/Home/ProvideService/submit_alluserdata.dart';
import '../../Universal/all_done_view.dart';

class ProviderAddNewServiceView extends StatelessWidget {
  const ProviderAddNewServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controler=Get.put(SubmitAllUserDataController());
    return Scaffold(

      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: CustomButton2(
                  name: 'Next',
                  task: () {
                    moveRTL(screen:  PaymentDoneView(role: 'provider',));
                  }),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: ListView(
          children: [
            SizedBox(
              height: 29.h,
            ),
            const BackMoveAppBar(),
            SizedBox(
              height: 28.h,
            ),

            //______________MAIN TEXT
            MainTextWidget(
                text: 'Add Your Services',
                fontColor: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                align: TextAlign.left),

            SizedBox(
              height: 200.h,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ServiceRateCard(
                      role: 'admin',
                      image: serviceProviderImg,
                      serviceName: 'Service Name',
                      description:
                          'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
                      serviceRate: 30,
                    );
                  }),
            ),

            Container(
              height: 51.h,
              margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey,
                strokeWidth: 1.5,
                radius: const Radius.circular(20.0),
                child: Center(
                  child: MainTextWidget(
                    text: '+ Create New Service',
                    fontColor: purpleColor,
                    fontSize: 18.sp,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),

            
          ],
        ),
      ),
    );
  }
}
