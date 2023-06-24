import 'dart:convert';

import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Model/Booking.dart';
import 'package:intl/intl.dart';

import '../../../../Services/api_service.dart';
import '../../../../Services/local_storage.dart';
import '../../../api.dart';

class ProviderMainHomeController extends GetxController {
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
    dataLoading = true;
    update();
     gettingAllData();
    dataLoading = false;
    update();
  }

  gettingAllData() async {
    await getCurrentFormattedDate();
    await getAllBookingDeatail();
  }

  changeBooking({String? bookingtype}) {
    bookingType = bookingtype!;
    print('____________${bookingtype}');
    update();
  }

  //____________________________get current date
  getCurrentFormattedDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEEE dd MMMM yyyy');
    date = formatter.format(now);
    print('DATE ${date}');
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
        dataLoading = false;
        update();
      } else {
        customToast(jsonData['message']);
        dataLoading = false;
        update();
      }
    } catch (error) {
      customToast('Something went Wrong');
    }

  }


}
