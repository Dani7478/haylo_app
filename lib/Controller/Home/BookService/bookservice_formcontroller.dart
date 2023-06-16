import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Services/api_service.dart';
import '../../../Services/local_storage.dart';
import '../../../View/Common Widgets/navigate.dart';
import '../../../View/Screens/Home/BookService/addpayment_form_view.dart';
import '../../../View/Screens/Home/ProvideService/provide_category_formview.dart';
import '../../api.dart';
import '../../toast.dart';

class BookProfileFormController extends GetxController {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isTermsOk=false;
  bool isLoading=false;

  changedIsTermsOk(){
  bool isTermsOk=false;
    isTermsOk=!isTermsOk;
    update();
  }

  submitBooker() async {
    isLoading = true;
    update();
    Map<String, dynamic> providerData = {
      'signup_as': '1', // 1 means signup as a booker
      'first_name': firstNameCtrl.text,
      'last_name': lastNameCtrl.text,
      'email': emailCtrl.text,
      // 'image': multiPartImage,
      'password': passwordCtrl.text
    };


    var dataBody = await ApiService().postApiWithOutToken(providerData, signUpUrl);
    var decodData = json.decode(dataBody);
    print(decodData.toString());
    if (decodData['status'] == false) {
      customToast(decodData['message']);
    } else {
      customToast(decodData['message']);
      LocalStorage().storeDataInString(
          keyname: 'token', stringValue: decodData['data']['token']);
      moveRTL(screen: const BookerAddPaymentFormView());
    }
    isLoading = false;
    update();
  }
}
