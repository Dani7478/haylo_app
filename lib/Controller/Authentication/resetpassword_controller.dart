import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';

import '../api.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  bool isloading = false;

  resetNewPassword() async {
    isloading = true;
    update();
    String email = await LocalStorage().getString(keyName: 'email');
    var data = {
      "email": email,
      "password": passwordCtrl.text,
      "password_confirmation": confirmPasswordCtrl.text,
    };
    if (passwordCtrl != passwordCtrl) {
      customToast('Password Not Same');
    } else {
      var response =
          await ApiService().postApiWithOutToken(data, resetPasswordUrl);
      var jsonData = json.decode(response);
      if (jsonData['status'] == true) {
        customToast(jsonData['message']);
        moveLTR(screen: const LoginView());
      } else {
        customToast(jsonData['message']);
      }
    }
    isloading = false;
    update();
  }
}
