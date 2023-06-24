import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/service.dart';
import 'package:haylo_app/Model/uniquecategory_model.dart';

import '../../../../View/Common Widgets/navigate.dart';
import '../../../../View/Screens/Home/MainHome/Booker/booking_confirmed_view.dart';

class BookerLocationController extends GetxController {
  TextEditingController locationCtrl = TextEditingController();

  selectLocation() {}

  goNext(
    UniqueCategoryModel provider,
    Services service,
    String date,
    String time,
      bool immediately,
  ) {
    moveUTD(
        screen: BookerBookingConfirmed(
            service: service, provider: provider, date: date, time: time, immediately: immediately,));
  }
}
