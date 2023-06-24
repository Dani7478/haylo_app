import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/providerdetail_model.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerside_providerprofileview.dart';
import '../../../../../Controller/Home/MainHome/Booker/uniqueprovider_list_controller.dart';
import '../../../../../Model/booker_home_model.dart';
import '../../../../../Model/service_categories.dart';
import '../../../../../Model/uniquecategory_model.dart';
import '../../../../Common Widgets/widgets_links.dart';

class ProvidersListView extends StatelessWidget {
  ProvidersListView({super.key, required this.id, required this.categoryName});

  int id;
  String categoryName;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UniqueProviderControllers());
    controller.getAllUniqueProviders(id);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: 23.h,
              ),
              BackMoveAppBarWithTitle2(titleName: categoryName),
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Get.back();
              //       },
              //       child: CircleAvatar(
              //         backgroundColor: Colors.grey[300],
              //         radius: context.height * 0.03,
              //         child: Center(
              //           child: Icon(
              //             Icons.keyboard_arrow_left,
              //             color: Colors.black45,
              //             size: context.height * 0.05,
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 50.w,
              //     ),
              //     MainTextWidget(
              //         text: categoryNamecat,
              //         fontColor: Colors.black,
              //         fontSize: 18.sp,
              //         fontWeight: FontWeight.w500,
              //         align: TextAlign.left),
              //   ],
              // ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                thickness: 1.2,
                color: Color(0xFFE8E8E8),
              ),
              GetBuilder<UniqueProviderControllers>(builder: (controller) {
                return controller.isLoading== false ?
                  SizedBox(
                        height: 650.h,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.uniqueCategories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                moveUTD(
                                    screen:
                                         BookerSideProviderProfileView(providerData: controller.uniqueCategories[index],)
                                );
                              },
                              child: ProviderShowCard(
                                categoryDetail:
                                    controller.uniqueCategories[index],
                              ),

                              //  child: SizedBox(),
                            );
                          },
                        ),
                      ):
                    SizedBox(
                        height: 650.h,
                        child: const Center(child: LoadingView()));
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ProviderShowCard extends StatelessWidget {
  ProviderShowCard({
    super.key,
    required this.categoryDetail,
  });

  UniqueCategoryModel categoryDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h),
        // height: 200,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: containerLightBlueClr,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: grayColor, borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      categoryDetail!.profileImage!,
                    ),
                    fit: BoxFit.fill,
                  )
              ),

            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 230.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          text: categoryDetail.averageRating.toString(),
                          fontColor: textFieldTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          align: TextAlign.start)
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: '${categoryDetail.firstName} ${categoryDetail.lastName}',
                      fontColor: textFieldTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start),
                  SizedBox(
                    height: 5.h,
                  ),
                  MainTextWidget(
                      text: categoryDetail.uniqueSkills!,
                      fontColor: descriptionTextColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      align: TextAlign.start),
                  SizedBox(
                    height: 8.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: MainTextWidget(
                        text: 'Starting ${categoryDetail.minPrice} /Hour',
                        fontColor: purpleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        align: TextAlign.end),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
