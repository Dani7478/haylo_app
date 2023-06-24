import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/service.dart';
import 'package:haylo_app/Model/uniquecategory_model.dart';
import 'package:haylo_app/Services/api_service.dart';

import '../../../../View/Common Widgets/navigate.dart';
import '../../../../View/Screens/Home/MainHome/Booker/bookerhome_view.dart';
import '../../../api.dart';
import '../../../toast.dart';

class BookerBookingConfirmConfirmed extends GetxController {
  bool loading =false;
  submitData(
    Services service,
    UniqueCategoryModel provider,
    String date,
    String time,
      bool immediately,
  ) async {
    loading=true;
    update();
    int immediatly=immediately==true ? 1 : 0;
    var data = {
      'action': 'create',
      'service_id': service.id.toString(),
      'booking_date': date.toString(),
      'booking_time': time.toString(),
      'latitude': 31.40623252.toString(),
      'longitude': 74.25603223.toString(),
       // 'booking_id': null,
       // 'working_hours': null,
      'service_price': service.perHourPrice.toString().toString(),
      'immediatly':immediatly.toString()
    };
    print(bookingConfirmedUrl);
    print(data);
    var response =
        await ApiService().postApiWithToken(data, bookingConfirmedUrl);
    var jsonData = json.decode(response);
    if (jsonData['status'] == true) {
      customToast(jsonData['message']);
      moveUTD(screen: const BookerHomeView());
    } else {
      loading=false;
      update();
      customToast(jsonData['message']);
    }
  }
}
