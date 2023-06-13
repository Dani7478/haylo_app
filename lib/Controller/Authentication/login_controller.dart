import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Home/MainHome/Booker/bookerhome_view.dart';

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

    var response = await ApiService().postApiWithOutToken(loginData, loginUrl);
    var jsonData = json.decode(response);

    if (jsonData['status'] == true) {
      // customToast(jsonData['message']);
      moveUTD(screen: const BookerHomeView());
      print(jsonData.toString());
      customToast(jsonData['data']['token']);
      //LocalStorage().storeDataInString(keyname: 'token', stringValue:jsonData['data']['token'] );
    } else {
      customToast(jsonData['message']);
    }
  }
}
