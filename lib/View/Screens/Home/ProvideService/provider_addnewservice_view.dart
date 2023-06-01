import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/backmove_appbar.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/consts.dart';

import '../BookService/paymentdone_view.dart';

class ProviderAddNewServiceView extends StatelessWidget {
  const ProviderAddNewServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            //_________________
            Container(
              width: double.infinity,
              //  padding: EdgeInsets.only(left: 5.w, right: 5.w),
              padding: EdgeInsets.symmetric(
                vertical: 12.h
              ),
              child: Center(
                child: ListTile(
                  leading: SizedBox(
                    height: 56.h,
                    width: 73.w,
                    child: Image.asset(provideService1),
                  ),
                  title: MainTextWidget(
                    text: 'Service Name',
                    fontSize: 12.sp,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.left,
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 3.h),
                    // width: 200.w,
                    child: MainTextWidget(
                      text: 'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
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
                          child:  Center(
                            child: MainTextWidget(
                              text: '\$ 30 /HR',
                              fontSize: 10.sp,
                              fontColor: Colors.black,
                              fontWeight: FontWeight.w600,
                              align: TextAlign.left,
                            ),
                          )
                        ),
                        SizedBox(width: 5.w,),

                        Icon(
                          Icons.delete,
                          color:purpleColor,
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              //  padding: EdgeInsets.only(left: 5.w, right: 5.w),
              padding: EdgeInsets.symmetric(
                  vertical: 12.h
              ),
              child: Center(
                child: ListTile(
                  leading: SizedBox(
                    height: 56.h,
                    width: 73.w,
                    child: Image.asset(provideService1),
                  ),
                  title: MainTextWidget(
                    text: 'Service Name',
                    fontSize: 12.sp,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.left,
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 3.h),
                    // width: 200.w,
                    child: MainTextWidget(
                      text: 'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
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
                            child:  Center(
                              child: MainTextWidget(
                                text: '\$ 30 /HR',
                                fontSize: 10.sp,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w600,
                                align: TextAlign.left,
                              ),
                            )
                        ),
                        SizedBox(width: 5.w,),

                        Icon(
                          Icons.delete,
                          color:purpleColor,
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: 51.h,
              margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 40.h),
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
            SizedBox(height: 100.h,),

            CustomButton2(name:'Next', task: (){
              moveRTL(screen: const PaymentDoneView());
            })
          ],
        ),
      ),
    );
  }
}
