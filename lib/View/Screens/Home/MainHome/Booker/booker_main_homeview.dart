import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_service_listview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_service_selecterview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerside_providerprofileview.dart';

import '../../../../Common Widgets/widgets_links.dart';
import '../../../../Constants/images.dart';

class BookerMainHomeView extends StatelessWidget {
  const BookerMainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(children: [
          Container(
              width: double.infinity,
              height: 350.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      mainHomeBgImage,
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: double.infinity,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.w),
                        bottomLeft: Radius.circular(10.w),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainTextWidget(
                            text: 'Booking Started',
                            fontColor: whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            align: TextAlign.start),
                        // MainTextWidget(
                        //     text: '05:58:15',
                        //     fontColor: whiteColor,
                        //     fontSize: 14.sp,
                        //     fontWeight: FontWeight.w500,
                        //     align: TextAlign.start)

                        const HeaderTime(),
                      ],
                    ),
                  ),
                   MainHomeTopAppBar(role: 'booker'),
                  CleanerSection(name: 'jhon'),
                ],
              )),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: MainTextWidget(
                  text: 'Category',
                  fontColor: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.start)),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // Set the scroll direction to horizontal
              itemCount: 30,
              itemBuilder: (context, index) {
                return CategoryCircleCard(
                  image: electricianImg,
                  name: 'Electrtian',
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: MainTextWidget(
                text: 'Recomended Providers',
                fontColor: blackTextColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                align: TextAlign.start),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            height: 220.h,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // Set the scroll direction to horizontal
              itemCount: 30,
              itemBuilder: (context, index) {
                return RecomendedProviderCard();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: MainTextWidget(
                text: 'Recomended Services',
                fontColor: blackTextColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                align: TextAlign.start),
          ),
          Container(
            margin: EdgeInsets.all(15.h),
            height: 650.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    moveUTD(
                      screen: const BookerServiceSelector(),
                    );
                  },
                  child: ServiceProviderCard(
                    image: serviceProviderImg,
                    star: 4.5,
                    description:
                        'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
                    name: 'John Smith',
                    rate: 30,
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

   
}

class HeaderTime extends StatelessWidget {
  const HeaderTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        timeRemainSingleCard('H', '3'),
        SizedBox(width:2.w),
        MainTextWidget(
            text: ':',
            fontColor: whiteColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            align: TextAlign.center),
            SizedBox(width:2.w),
        timeRemainSingleCard('M', '58'),
          SizedBox(width:2.w),
        MainTextWidget(
            text: ':',
            fontColor: whiteColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            align: TextAlign.center),
           SizedBox(width:2.w),
        timeRemainSingleCard('S', '35'),
      ],
    );
  }

  timeRemainSingleCard(String chr, String time) {
    return Container(
      height: 31.h,
      width: 28.w,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainTextWidget(
              text: chr,
              fontColor: purpleColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              align: TextAlign.center),
          MainTextWidget(
              text: time,
              fontColor: blackTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center)
        ],
      ),
    );
  }
}


class CategoryCircleCard extends StatelessWidget {
  CategoryCircleCard({super.key, required this.image, required this.name});
  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              moveLTR(screen: const BookerServiceListView());
            },
            child: Container(
              padding: EdgeInsets.all(15.0.h),
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: containerShadowClr,
                        blurRadius: 6.0.sp,
                        offset: const Offset(0, 0))
                  ]),
              child: SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          MainTextWidget(
              text: name,
              fontColor: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              align: TextAlign.center),
        ],
      ),
    );
  }
}

class CleanerSection extends StatelessWidget {
  CleanerSection({super.key, required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTextWidget(
                    text: 'Hi $name',
                    fontColor: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    align: TextAlign.start),
                SizedBox(
                  height: 6.h,
                ),
                MainTextWidget(
                    text: 'What service do\nyou need?',
                    fontColor: purpleColor,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.start),
              ],
            ),
          ),
          Expanded(
            flex: 40,
            child: SizedBox(
              height: 172.h,
              width: 172.h,
              child: Image.asset(
                cleanerMainHome,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecomendedProviderCard extends StatelessWidget {
  const RecomendedProviderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        moveUTD(screen: const BookerSideProviderProfileView());
      },
      child: Container(
        margin: EdgeInsets.all(8.0.h),
        padding: EdgeInsets.all(10.h),
        height: 200.h,
        width: 161.w,
        decoration: BoxDecoration(
            color: containerLightBlueClr,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 105.h,
              width: 141.w,
              child: Image.asset(
                serviceProviderImg,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20.h,
                  color: greenIconClr,
                ),
                SizedBox(
                  width: 4.w,
                ),
                MainTextWidget(
                    text: '4.5',
                    fontColor: textFieldTextColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.start)
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            MainTextWidget(
                text: 'Jhon Smith',
                fontColor: textFieldTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                align: TextAlign.start),
            SizedBox(
              height: 4.h,
            ),
            MainTextWidget(
                text: 'Starting \$ 30 / Hour',
                fontColor: purpleColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                align: TextAlign.start),
          ],
        ),
      ),
    );
  }
}
