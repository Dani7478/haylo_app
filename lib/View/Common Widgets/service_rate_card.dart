import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/ProvideService/provideraddnewservice_controller.dart';
import 'package:haylo_app/Model/user_service.dart';
import '../Constants/colors.dart';
import '../Constants/images.dart';
import 'widgets_links.dart';

class ServiceRateCard extends StatelessWidget {
  ServiceRateCard({
    super.key,
    required this.role,
    required this.service,
  });
  String role;
  UserService service;

  @override
  Widget build(BuildContext context) {
    var controller =Get.put(ProviderAddNewServiceController());
    return Container(
      width: double.infinity,
      //  padding: EdgeInsets.only(left: 5.w, right: 5.w),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Center(
        child: ListTile(
          leading: SizedBox(
            height: 56.h,
            width: 73.w,
            child: Image.asset(provideService1),
          ),
          title: MainTextWidget(
            text: service.name!,
            fontSize: 12.sp,
            fontColor: Colors.black,
            fontWeight: FontWeight.w500,
            align: TextAlign.left,
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 3.h),
            // width: 200.w,
            child: MainTextWidget(
              text:service.description!,
              fontSize: 8.sp,
              fontColor: Colors.black,
              fontWeight: FontWeight.w300,
              align: TextAlign.start,
            ),
          ),
          trailing: SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 35.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grayColor,
                        // width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: MainTextWidget(
                        text: '${service.priceCurrency} ${service.perHourPrice} /HR',
                        fontSize: 10.sp,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.left,
                      ),
                    )),
                SizedBox(
                  width: 5.w,
                ),
                role == 'admin'
                    ? GestureDetector(
                  onTap: (){
                    controller.deleteService(service);
                  },
                      child: const Icon(
                          Icons.delete,
                          color: purpleColor,
                        ),
                    )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
