import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/backmover_circular.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';

import '../../../../Controller/Home/ProvideService/provideraddnewservice_controller.dart';
import '../../../../Controller/Home/ProvideService/providersubmit_alluserdata.dart';
import '../../../Common Widgets/customprice_textfield.dart';
import '../../Universal/all_done_view.dart';

class ProviderAddNewServiceView extends StatelessWidget {
  const ProviderAddNewServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderAddNewServiceController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: CustomButton2(
            name: 'Next',
            task: () {
              moveRTL(
                  screen: PaymentDoneView(
                role: 'provider',
              ));
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

            GetBuilder<ProviderAddNewServiceController>(builder: (controller) {
              return controller.loadingData == false
                  ? SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                          itemCount: controller.serviceList.length,
                          itemBuilder: (context, index) {
                            return ServiceRateCard(
                                role: 'admin',
                                service: controller.serviceList[index]);
                          }),
                    )
                  : SizedBox();
            }),

            GestureDetector(
              onTap: () {
                addServiceDialogBox();
              },
              child: Container(
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
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }

  void addServiceDialogBox() {
    var controller = Get.put(ProviderAddNewServiceController());

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
                  text: 'Create New Service',
                  fontColor: blackTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  addServiceDialogBox();
                },
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.grey,
                    strokeWidth: 1,
                    radius: Radius.circular(20.0),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload,
                          color: grayColor,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MainTextWidget(
                            text: 'upload Image',
                            fontColor: grayColor,
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.w500,
                            align: TextAlign.center),
                      ],
                    )),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MainTextWidget(
                text: 'Service Name',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: controller.serviceNameCtrl,
              hintText: 'Type Here',
              abscr: false,
              error: 'field must be filled',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 15.h,
            ),
            MainTextWidget(
                text: 'Service Description',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              controller: controller.serviceDescriptionCtrl,
              hintText: 'Type here',
              abscr: false,
              error: 'field must be filled',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 15.h,
            ),
            MainTextWidget(
                text: 'ServicePrice',
                fontColor: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.left),
            SizedBox(
              height: 5.h,
            ),
            CustomPriceTextField(
              hintText: 'Type here',
              controller: controller.servicePriceCtrl,
              error: 'Add service here',
              pattern: nameRegix,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton2(
                name: 'Save',
                task: () {
                  controller.postNewService();
                  Get.back();
                }),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
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
      contentPadding: EdgeInsets.zero,
    );
  }
}
