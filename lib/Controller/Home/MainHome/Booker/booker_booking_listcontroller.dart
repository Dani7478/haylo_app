
import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Model/Booking.dart';
import '../../../../Services/api_service.dart';
import '../../../api.dart';
import '../../../toast.dart';

class BookerBookingListController extends GetxController{
  String bookingType = 'ongoing';
  String date = 'Loading';
  List<Booking> bookingList = [];
  List<Booking> historyBooking=[];
  bool dataLoading = true;

  @override
  void onInit() {
    gettingAllData();
    super.onInit();
  }

  Future<void> refreshData() async {
    gettingAllData();
  }

  gettingAllData() async {
    dataLoading = true;
    update();
    await getAllBookingDeatail();
    dataLoading = false;
    update();
  }

  changeBooking({String? bookingtype}) {
    bookingType = bookingtype!;
    update();
  }



  getAllBookingDeatail() async {
    bookingList.clear();
    historyBooking.clear();
    var data = {'action': 'view'};

    var response =
    await ApiService().postApiWithToken(data, getProviderBookingUrl);
    var jsonData = json.decode(response);
    try {
      if (jsonData['status'] == true) {
        var list = jsonData['data']['upcoming_bookings'];
        var list2 = jsonData['data']['history'];
        for (int i = 0; i < list.length; i++) {
          Booking book = Booking.fromJson(list[i]);
          bookingList.add(book);
        }
        for(int i=0; i<list2.length ;i++){
          Booking book = Booking.fromJson(list2[i]);
          historyBooking.add(book);
        }
        print(bookingList[1]);
        dataLoading = false;
        update();
      } else {
        customToast(jsonData['message']);
        dataLoading = false;
        update();
      }
    } catch (error) {
      print(error.toString());
      customToast('Something Went Wrong');
    }

  }

}