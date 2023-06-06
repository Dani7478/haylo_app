

import 'package:get/get.dart';

class ProviderMainHomeController extends GetxController {

  String bookingtype='ongoing';


  changeBooking({String? bookingtype}){
    this.bookingtype=bookingtype!;
    print('____________${bookingtype}');
    update();
  }

}