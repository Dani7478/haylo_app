import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_service_listview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/booker_service_selecterview.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerside_providerprofileview.dart';
import '../../../../../Controller/controller_links.dart';
import '../../../../../Model/booker_home_model.dart';
import '../../../../../Model/categories.dart';
import '../../../../Common Widgets/widgets_links.dart';
import '../../../../Constants/images.dart';
import 'booker_unique_provider_listview.dart';

class BookerMainHomeView extends StatelessWidget {
  const BookerMainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(BookerMainHomeController());
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GetBuilder<BookerMainHomeController>(
          builder: (controller) {
            return controller.loadingData==true? const LoadingView() :  ListView(children: [
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
                        height: 38.h,
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
                            InkWell(

                              onTap:(){
                                controller.getBookerHomeData();
                              },
                              child: MainTextWidget(
                                  text: 'Booking Started',
                                  fontColor: whiteColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  align: TextAlign.start),
                            ),
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
                       CleanerSection(name: '${controller.user!.lastName}'),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 13, right: 13, top: 20, bottom: 10),
                  child: MainTextWidget(
                      text: 'Category',
                      fontColor: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.start)),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Set the scroll direction to horizontal
                  itemCount: controller.bookerHomeData!.categories!.length!,
                  itemBuilder: (context, index) {
                    return CategoryCircleCard(
                     category: controller.bookerHomeData!.categories![index],
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: MainTextWidget(
                    text: 'Recommended Providers',
                    fontColor: blackTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.start),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                height: 220.h,
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Set the scroll direction to horizontal
                  itemCount: controller.bookerHomeData?.recommendedProviders?.length,
                  itemBuilder: (context, index) {
                    return  GestureDetector(
                      onTap: (){
                        //moveUTD(Provider)
                      },
                      child: RecomendedProviderCard(
                        recomendedprovider: controller.bookerHomeData!.recommendedProviders![index],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: MainTextWidget(
                    text: 'Recommended Services',
                    fontColor: blackTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.start),
              ),
              Container(
                margin: EdgeInsets.all(15.h),
                height: 650.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.bookerHomeData?.services?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        moveUTD(
                          // screen: const BookerServiceSelector(),
                        );
                      },
                      child: RecommendedSeriveCard(
                        recommendedService: controller.bookerHomeData!.services![index],
                      ),
                    );
                  },
                ),
              ),
            ]);
          }
        ),
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
  CategoryCircleCard({super.key, required this.category});
  Categories category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              moveLTR(screen:  ProvidersListView(
                id: category.id!,
                categoryName: category.categoryName!,
              ));
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
                  child: Image.network(
                    category.categoryImage!,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          MainTextWidget(
              text: category.categoryName!,
              fontColor: Colors.black,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
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
                    text: 'Hi, $name',
                    fontColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.start),
                SizedBox(
                  height: 6.h,
                ),
                MainTextWidget(
                    text: 'What service do\nyou need?',
                    fontColor: purpleColor,
                    fontSize: 23,
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
   RecomendedProviderCard({super.key, required this.recomendedprovider});
  RecommendedProviders recomendedprovider;


  @override
  Widget build(BuildContext context) {
    return Container(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(
                  recomendedprovider.profileImage!,
                ),
                fit: BoxFit.fill
              )
            ),
            // child: Image.network(
            //   recomendedprovider.profileImage!,
            //   fit: BoxFit.fitWidth,
            // ),
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
                  text: recomendedprovider.averageRating.toString(),
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
              text: '${recomendedprovider.firstName!} ${recomendedprovider.lastName!}',
              fontColor: textFieldTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              align: TextAlign.start),
          SizedBox(
            height: 4.h,
          ),
          MainTextWidget(
              //text: 'Starting \$ ${recomendedprovider.perHourPrice} / Hour',
              text: 'Starting \$ ${recomendedprovider.perHourPrice} / Hour',
              fontColor: purpleColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              align: TextAlign.start),
        ],
      ),
    );
  }
}
