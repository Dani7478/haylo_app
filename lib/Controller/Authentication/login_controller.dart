import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerhome_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_home_view.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Provider/provider_main_homeview.dart';
import 'package:get/get.dart';

import '../../Model/user.dart';
import '../Home/MainHome/Provider/provider_bottomappbar_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwrdCtrl = TextEditingController();
  bool isremember = false;
  bool isloading = false;

  changeIsRemember() {
    isremember = !isremember;
    update();
  }

  login() async {
    isloading = true;
    update();

    Map<String, dynamic> loginData = {
      'login': emailCtrl.text,
      'password': passwrdCtrl.text,
    };

    try{
      var response = await ApiService().postApiWithOutToken(loginData, loginUrl);
      var jsonData = json.decode(response);

      if (jsonData['status'] == true) {
        customToast(jsonData['message']);
        LocalStorage().storeDataInString(
            keyname: 'token', stringValue: (jsonData['data']['token']));

        await getUserData();
      } else {
        customToast(jsonData['message']);
      }
    }catch(error){
      customToast('Slow Internet');
      isloading = false;
      update();
    }

    isloading = false;
    update();
  }

  getUserData() async {
    var response = await ApiService().getApiDatawithToken(url: userDataUrl);

    var jsonResponse = json.decode(response);
    LocalStorage().storeDataInString(
        keyname: 'userData', stringValue: response.toString());

    if (jsonResponse['status'] == true) {
      var controller = Get.put(ProviderAppBarController());
      controller.updateView('home');

      var controller2 = Get.put(BookerAppBarController());
      controller2.updateView('home');

      User user = User.fromJson(jsonResponse['data']);
      int userType = int.parse(user.type.toString());
      customToast(userType.toString());
      if (userType == 1) {
        moveLTR(screen: const BookerHomeView());
      } else if (userType == 2) {
        moveLTR(screen: const ProviderHomeView());
      }
    } else {}
  }
}
