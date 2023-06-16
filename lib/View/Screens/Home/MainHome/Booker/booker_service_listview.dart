import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerside_providerprofileview.dart';
import '../../../../../Controller/Home/MainHome/Booker/bookerservice_controller.dart';
import '../../../../Common Widgets/widgets_links.dart';

class BookerServiceListView extends StatefulWidget {
  BookerServiceListView({super.key, required this.id});

  int id;

  @override
  State<BookerServiceListView> createState() => _BookerServiceListViewState();
}

class _BookerServiceListViewState extends State<BookerServiceListView> {
var controller =Get.put(BookerServiceListController());
  @override
  void initState() {
   controller.getCategorizeUsers(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: context.height * 0.03,
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black45,
                          size: context.height * 0.05,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  MainTextWidget(
                      text: 'Service Name',
                      fontColor: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      align: TextAlign.left),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                thickness: 1.2,
                color: Color(0xFFE8E8E8),
              ),
              SizedBox(
                height: 650.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        moveUTD(screen: const BookerSideProviderProfileView());
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
