import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/controller_links.dart';
import 'package:haylo_app/Services/local_storage.dart';
import '../../../../Services/api_service.dart';
import '../../../../View/Common Widgets/navigate.dart';
import '../../../../View/Screens/Authentication/login_view.dart';
import '../../../api.dart';
import '../../../controller_manager.dart';
import 'package:get/get.dart';

import '../../../toast.dart';
class BookerProfileController extends GetxController {

  // logoutUser(){
  //   LocalStorage().clearCache();
  //   Get.find<LoginController>().emailCtrl.text='';
  //   Get.find<LoginController>().passwrdCtrl.text='';
  //   moveUTD(screen: const LoginView());
  //
  // }

  logoutUser() async {
    var response = await ApiService().getApiDatawithToken(url: logoutUrl);
    var jsonResponse = json.decode(response.toString());
    print('logout Response ${jsonResponse.toString()}');
    if (jsonResponse['status'] == true) {
      customToast('Logout');
      LocalStorage().clearCache();
      LocalStorage().clearCache();
      Get.find<LoginController>().emailCtrl.text='';
      Get.find<LoginController>().passwrdCtrl.text='';
      moveUTD(screen: const LoginView());
    } else {
      customToast('Something went wrong');
    }
  }

}