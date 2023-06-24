import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haylo_app/View/Constants/consts.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import '../../../Controller/Chat/chat_controller.dart';
import '../../Common Widgets/main_text.dart';
import '../../Constants/colors.dart';

class ChatttingView extends StatefulWidget {
   ChatttingView({super.key, });

  @override
  State<ChatttingView> createState() => _ChatttingViewState();
}

var controller=Get.put(ChattingController());

class _ChatttingViewState extends State<ChatttingView> {


  @override
  void initState() {
    controller.getMessages(4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () async {
        print('checking');
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          padding:
              EdgeInsets.only(left: 22.w, top: 25.h, bottom: 26.h, right: 25.w),
          height: 73.h,
          decoration: const BoxDecoration(color: whiteColor, boxShadow: [
            BoxShadow(
                blurRadius: 7.0, color: containerShadowClr, offset: Offset(0, -4))
          ]),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical:6.h),
                hintText: 'Type Something',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: grayTextClr,
                ),
                prefixIcon: Icon(
                  Icons.face_5_outlined,
                  color: grayColor,
                  size: 35.sp,
                ),
                suffixIcon: Icon(
                  Icons.send,
                  color: purpleColor,
                  size: 35.sp,
                ),
                border: InputBorder.none),
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: blackTextColor,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const ChatHeaderSection(),
            Expanded(
                child: GetBuilder<ChattingController>(
                  builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.messagesList.length,
                        itemBuilder: (context, index) {
                          String type = 'sender';
                          if (index % 2 == 0) {
                            type = 'reciever';
                          }
                          return ChatCard(
                              type: type,
                              date: '',
                              image: chatProfileImg,
                              message:
                                  'Hi Cassie! Would you be available for a coffee next week? 😁'
                          );
                        });
                  }
                ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  ChatCard(
      {super.key,
      required this.type,
      required this.message,
      required this.date,
      required this.image});
  String type;
  String image;
  String message;
  String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 30.h),
      child: type == 'reciever'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(image),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 230.w,
                  height: 80.h,
                  child: ChatBubble(
                    clipper: ChatBubbleClipper2(type: BubbleType.sendBubble),
                    backGroundColor: grayColor,
                    child: MainTextWidget(
                        text: message,
                        fontColor: blackTextColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        align: TextAlign.start),
                  ),
                ),
              ],
            )
          : SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 230.w,
                    height: 66.h,
                    child: ChatBubble(
                      clipper: ChatBubbleClipper2(type: BubbleType.sendBubble),
                      backGroundColor: purpleColor,
                      child: MainTextWidget(
                          text: message,
                          fontColor: whiteColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          align: TextAlign.start),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class ChatHeaderSection extends StatelessWidget {
  const ChatHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
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
                width: 5.w,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: context.height * 0.03,
                child: Center(child: Image.asset(chatProfileImg)),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: MainTextWidget(
                    text: 'Cordelia John',
                    fontColor: blackTextColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.start),
              ),
            ],
          ),
        ));
  }
}
