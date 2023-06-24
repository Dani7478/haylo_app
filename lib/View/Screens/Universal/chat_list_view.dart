import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/Model/conservation.dart';
import 'package:haylo_app/View/Common%20Widgets/main_text.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:haylo_app/View/Screens/Universal/chatting_view.dart';
import 'package:get/get.dart';
import '../../../Controller/controller_links.dart';
import '../../Common Widgets/loading.dart';


class ChatListView extends StatelessWidget {
   ChatListView({Key? key, required this.role}) : super(key: key);

  String role;

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ChattingController());
    return RefreshIndicator(
      onRefresh: controller.getAllData,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              MainTextWidget(
                  text: 'Chat',
                  fontColor: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 1.2,
                color: Color(0xFFE8E8E8),
              ),

              SizedBox(
                height: 800,
               child: GetBuilder<ChattingController>(
                 builder: (controller) {
                   return controller.isLoading==false ?   ListView.builder(
                        itemCount: controller.conservationList.length,
                        itemBuilder: (context,index){
                         Conservation singleConservation =controller.conservationList[index];
                          return GestureDetector(
                            onTap: (){
                              // controller.getAllData();
                              moveUTD(
                                screen:  ChatttingView(),
                              );
                            },
                            child:  chatViewCard(
                                name: singleConservation.otherUserName,
                                image: singleConservation.otherUserAvatar,
                                message: singleConservation.text,
                                date: singleConservation.createdTime.toString()
                            ),
                          );
                        }): const LoadingView();
                 }
               ),
              )
            ],
          ),
        ),
      ),
    );
  }

  chatViewCard({String? image, String? name, String? message, String? date}) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Container(
        //color: Colors.yellow,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: purpleColor,
                      backgroundImage: NetworkImage(image!),
                      // child: Image.network(
                      //   image!, fit: BoxFit.fill,),
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween
                            ,
                            children: [
                              //person name
                              MainTextWidget(
                                  text: name!,
                                  fontColor: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  align: TextAlign.start),


                              //date
                              MainTextWidget(
                                  text: date!,
                                  fontColor: const Color(0xFFB1B1B1),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  align: TextAlign.start),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h,),

                        SizedBox(
                          width: 250.w,
                          child: MainTextWidget(
                              text: 'I just invited you and Jacob to dinner on Friday. You better be there',
                              fontColor: const Color(0xFFB1B1B1),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              align: TextAlign.start),
                        ),


                        const Divider(
                            thickness: 1,
                            color: Colors.black
                        ),

                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 69, right: 20),
                  child: Divider(
                    thickness: 1.2,
                  ),
                ),
              ],
            )
      ),
    );

  }
}
var controller=Get.put(ChattingController());
