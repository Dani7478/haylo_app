import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Constants/colors.dart';
import 'package:haylo_app/View/Screens/Home/BookService/addpayment_form_view.dart';

import '../../../../Common Widgets/widgets_links.dart';
import '../../../../Constants/images.dart';

class BookerPaymentUpdateView extends StatelessWidget {
  const BookerPaymentUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: BackMoveAppBarWithTitle(titleName: 'Payment Method'),
          ),
          const Divider(
            color: dividerColor,
            thickness: 1.5,
          ),
          SizedBox(
            height: 20.h,
          ),

          SizedBox(
            height: 171.h,
            width: 345.w,
            child: Image.asset(atmCardImage2,fit: BoxFit.fill,),
          ),

          
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
            child: CustomButtonWithBorder(name: 'Update Payment Method', task: (){
              moveUTD(screen: const BookerAddPaymentFormView());
            }),
          )
        ],
      ),
    );
  }
}
