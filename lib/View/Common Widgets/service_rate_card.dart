import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/ProvideService/provideraddnewservice_controller.dart';
import 'package:haylo_app/Model/user_service.dart';
import '../../Model/service.dart';
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
  Services service;

  @override
  Widget build(BuildContext context) {
    var controller =Get.put(ProviderAddNewServiceController());
    return Container(
      width: double.infinity,
      //  padding: EdgeInsets.only(left: 5.w, right: 5.w),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Center(
        child: ListTile(
          leading: Container(
            height: 80.h,
            width: 73.w,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             image: DecorationImage(
               image: NetworkImage(
                  service.image!
               ),
               fit: BoxFit.cover
             )
           ),
          ),
          title: MainTextWidget(
            text: service.name!,
            fontSize: 14,
            fontColor: Colors.black,
            fontWeight: FontWeight.bold,
            align: TextAlign.left,
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 3.h),
            // width: 300.w,
            child: MainTextWidget(
              //error remoive in split wise
              text:'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
              fontSize: 12,
              fontColor: descriptionTextColor,
              fontWeight: FontWeight.w400,
              align: TextAlign.start,
            ),
          ),
          trailing: SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 40.h,
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
                        fontSize: 11.sp,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.bold,
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
        // child: Container(
        //   child: Row(
        //     children: [
        //       //________image
        //         Container(
        //           height: 58.h,
        //           width: 87.w,
        //          decoration: BoxDecoration(
        //            borderRadius: BorderRadius.circular(12.0),
        //            image: DecorationImage(
        //              image: NetworkImage(
        //                 service.image!
        //              ),
        //              fit: BoxFit.cover
        //            )
        //          ),
        //         ),
        //       SizedBox(
        //         width: 10.w,
        //       ),
        //       Container(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //              MainTextWidget(
        //                 text: service.name!,
        //                 fontSize: 14,
        //                 fontColor: Colors.black,
        //                 fontWeight: FontWeight.w600,
        //                 align: TextAlign.left,
        //               ),
        //
        //             SizedBox(
        //               height: 8.h,
        //             ),
        //
        //                Container(
        //                 margin: EdgeInsets.only(top: 3.h),
        //                 // width: 300.w,
        //                 child: MainTextWidget(
        //                   text:service.description!,
        //                   fontSize: 10,
        //                   fontColor: descriptionTextColor,
        //                   fontWeight: FontWeight.w300,
        //                   align: TextAlign.start,
        //                 ),
        //               ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        //
        //
        // ),
      ),
    );
  }
}
