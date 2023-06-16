import 'dart:convert';

import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Model/Booking.dart';
import 'package:intl/intl.dart';

import '../../../../Services/api_service.dart';
import '../../../../Services/local_storage.dart';
import '../../../api.dart';

class ProviderMainHomeController extends GetxController {
  String bookingtype = 'ongoing';
  String date = 'Loading';
  List<Booking> bookingList=[];

  @override
  void onInit() {
    super.onInit();
    getCurrentFormattedDate();
    getAllBookingDeatail();
  }

  changeBooking({String? bookingtype}) {
    this.bookingtype = bookingtype!;
    print('____________${bookingtype}');
    update();
  }

  //____________________________get current date
   getCurrentFormattedDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEEE dd MMMM yyyy');
    date = formatter.format(now);
    update();
  }


  getAllBookingDeatail() async {
    var data={
      'action':'view'
    };
    var response= await ApiService().postApiWithToken(data, getProviderBookingUrl);

    var jsonData=json.decode(response);

    try{
      if(jsonData['status']==true){
        var list=jsonData['data']['upcoming_bookings']['data'];

        for(int i=0; i<list.length; i++) {
         Booking book= Booking.fromJson(list[i]);
         bookingList.add(book);
        }
        print('list of booking: ${bookingList.length}');
      }else {
        customToast(jsonData['message']);
      }
    }catch(error){
      customToast('Something went Wrong');
    }

  }
}
