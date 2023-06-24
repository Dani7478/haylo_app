import 'dart:convert';

import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Model/booker_home_model.dart';
import 'package:haylo_app/Services/local_storage.dart';
import '../../../../Model/service.dart';
import '../../../../Model/user.dart';
import '../../../../Services/api_service.dart';

class BookerMainHomeController extends GetxController {
  bool loadingData = true;
  List<Services> serviceList = [];
  User? user;
  BookerHomeModel? bookerHomeData;

  @override
  void onInit() {
    gettingAllData();
    super.onInit();
  }

  getBookerHomeData() async {
    var response =
        await ApiService().getApiDatawithToken(url: getBookerHomeUrl);
    var jsonData = json.decode(response);
    print(jsonData);
    if (jsonData['status'] == true) {
      bookerHomeData = BookerHomeModel.fromJson(jsonData['data']);
      customToast(jsonData['message']);
     
    } else {
      customToast(jsonData['message']);
    }
  }

  gettingAllData() async {
    serviceList = await ApiService().getAllServices();
    user = await LocalStorage().getUserData();
    await getBookerHomeData();
    loadingData = false;
    update();
  }
}
