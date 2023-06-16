import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/MainHome/Booker/booker_search_controller.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Constants/styles.dart';
import 'package:haylo_app/View/Screens/Home/BookService/bookservice_form_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_service_listview.dart';

import '../../../../Constants/colors.dart';

class BookerSearchView extends StatelessWidget {
  const BookerSearchView({Key? key}) : super(key: key);

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
                text: 'Search',
                fontColor: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                align: TextAlign.center),
            SizedBox(
              height: 20.h,
            ),
           
            const SearchBar(),
            SizedBox(
              height: 25.h,
            ),
            MainTextWidget(
                text: 'Suggestion',
                fontColor: textFieldTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                align: TextAlign.start),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal

                itemCount: 5,
                itemBuilder: (context, index) {
                  return suggetionCard('Electritioan');
                },
              ),
            ),

            SizedBox(height: 100.h,),

            SizedBox(
              height: 253.h,
              width: 227.w,
              child:Image.asset(searchMainIcon)
            )

            
          ],
        ),
      ),
    );
  }

  suggetionCard(String service) {
    return GestureDetector(
      onTap: (){
        // Get.to(
        //   const BookerServiceListView(),
        //   transition: Transition.upToDown,
        //   duration: const Duration(milliseconds:400 ),
        // );
      },
      child: Container(
        margin: EdgeInsets.all(5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        width: 112.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18.w),
            boxShadow: [
              BoxShadow(
                  color: containerShadowClr,
                  blurRadius: 6.sp,
                  spreadRadius: 3,
                  offset: Offset(0, 0))
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              height: 20.h, width: 13.w, child: Image.asset(suggestServiceIcon)),
          SizedBox(
            width: 8.w,
          ),
          MainTextWidget(
              text: service,
              fontColor: textFieldTextColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center)
        ]),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookerSearchController());

    return Container(
        height: 47.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: containerShadowClr,
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 2), // Offset to apply shadow at the top
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: grayIconsColor,
                size: 30,
              ),
              SizedBox(
                width: 250.w,
                child: TextField(
                  controller: controller.searchCtrl,
                  decoration: InputDecoration(
                    hintText: 'What are you Looking',
                    hintStyle: CustomTextStyles().hinttextstyle,
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  style: CustomTextStyles().textFieldmainText,
                ),
              )
            ],
          ),
        ));
  }
}
