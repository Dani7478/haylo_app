import 'dart:convert';

import 'package:get/get.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_home_view.dart';

import '../../../api.dart';

class ProviderServiceDetailController extends GetxController {

  bookedService(String status, int id) async {
    var data= {
      'action':'edit',
      'status':status,
      'booking_id':id.toString(),
    };

    try{
    var response= await ApiService().postApiWithToken(data, bookingConfirmedUrl);
    var jsonData=json.decode(response);

    if(jsonData['status']==true){
      customToast(jsonData['message']);
      Get.find<ProviderMainHomeController>().gettingAllData();
      moveUTD(screen: const ProviderHomeView());
    }else {
      customToast(jsonData['message']);
    }
    }catch(error){
      customToast('Something Went Wrong');
    }
  }
}
