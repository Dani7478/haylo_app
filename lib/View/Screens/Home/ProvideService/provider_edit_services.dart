import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/user_service.dart';
import 'package:haylo_app/View/Common%20Widgets/backmover_circular.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';

import '../../../../Controller/Home/ProvideService/provideraddnewservice_controller.dart';
import '../../../../Controller/Home/ProvideService/providersubmit_alluserdata.dart';
import '../../../../Model/service.dart';
import '../../../Common Widgets/customprice_textfield.dart';
import '../../Universal/all_done_view.dart';

class ProviderEditServicesView extends StatelessWidget {
  const ProviderEditServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderAddNewServiceController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: CustomButton2(
            name: 'Next',
            task: () {
              // moveRTL(
              //     screen: PaymentDoneView(
              //   role: 'provider',
              // ));
              controller.getAllProviderService();
            }),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: ListView(
          children: [
            SizedBox(
              height: 29.h,
            ),
            BackMoveAppBarWithTitle2(titleName: 'Edit Service'),
            const Divider(
              thickness: 1.3,
            ),
            SizedBox(
              height: 28.h,
            ),
            Container(
              // color: Colors.yellow,
              height: 700.h,
              child: GetBuilder<ProviderAddNewServiceController>(
                builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.serviceList.length,
                      itemBuilder: (context, index) {
                        return ServiceProviderCard(
                          service:controller.serviceList[index]
                        );
                      });
                }
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
                  controller.getAllProviderService();
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
      //insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class ServiceProviderCard extends StatelessWidget {
  ServiceProviderCard(
      {super.key,
      required this.service});

 Services service;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProviderAddNewServiceController());
    return Container(
      width: double.infinity,
      //  padding: EdgeInsets.only(left: 5.w, right: 5.w),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Center(
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 56.h,
                width: 73.w,
                child: Image.asset(provideService1),
              ),
              title: MainTextWidget(
                text: service.name!,
                fontSize: 14.sp,
                fontColor: Colors.black,
                fontWeight: FontWeight.w500,
                align: TextAlign.left,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3.h),
                    // width: 200.w,
                    child: MainTextWidget(
                      text: service.description!,
                      fontSize: 10.sp,
                      fontColor: descriptionTextColor,
                      fontWeight: FontWeight.w300,
                      align: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  MainTextWidget(
                    text: '${service.priceCurrency} ${service.perHourPrice}/hr',
                    fontSize: 12.sp,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.left,
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 84.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        addServiceDialogBox(service);
                      },
                      child: Container(
                          height: 37.h,
                          width: 37.w,
                          decoration: BoxDecoration(
                            color: containerLightBlueClr,
                            // width: 1.0,

                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                              child: Icon(
                                Icons.edit,
                                size: 18.0,
                                color: grayColor,
                              ))),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.deleteService(service);
                      },
                      child: Container(
                          height: 37.h,
                          width: 37.w,
                          decoration: BoxDecoration(
                            color: containerLightBlueClr,
                            // width: 1.0,

                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                              child: Icon(
                                Icons.delete,
                                size: 18.0,
                                color: grayColor,
                              ))),
                    ),
                  ],
                ),
              ),
            ),
           const Divider(),
          ],
        ),
      ),
    );
  }

  void addServiceDialogBox(Services service) {
    var controller = Get.put(ProviderAddNewServiceController());
    controller.fillData(service);

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

                },
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.grey,
                    strokeWidth: 1,
                    radius:  Radius.circular(20.0),
                    child:  Center(
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
              controller:  controller.serviceDescriptionCtrl,
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
                name: 'Update',
                task: () {
                 controller.updateService(service);
                 Get.back();
                //  Get.back();
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
      //insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
    );
  }

}
