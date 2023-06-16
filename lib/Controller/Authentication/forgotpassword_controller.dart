import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Authentication/varification_code_view.dart';

import '../api.dart';
import '../toast.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  bool isloading=false;

  // forgotUserPassword() {
  //   String link = forgotPasswordUrl + emailCtrl.text;
  //   var response = ApiService().getApiDatawithToken(url: link);
  //   print(response.toString());
  // }

  sentCode() async {
    isloading=true;
    update();
    String url = forgotPasswordUrl + emailCtrl.text;
    var response = await ApiService().getApiDatawithoutToken(url: url);
    print(response.toString());
    var jsonData=json.decode(response);
    print(jsonData.toString());
    if(jsonData['status']==true){
      LocalStorage().setString(keyName: 'email', keyValue: emailCtrl.text);
      customToast(jsonData['message']);
      isloading=false;
      moveLTR(screen: VarificationCodeView(code: '1234',));
      update();
    }else {
      isloading=false;
      customToast(jsonData['message']);
      update();
    }
  }
}
