import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';

import '../../../Services/api_service.dart';
import '../../../View/Common Widgets/navigate.dart';
import '../../../View/Screens/Home/ProvideService/provider_paymentform_view.dart';
import '../../api.dart';

class ProviderCategoryFormController extends GetxController {
  TextEditingController uniqueSkillCtrl = TextEditingController();
  TextEditingController uniquePitch = TextEditingController();
  

  List<String> serviceList = ['Select'];
  List<String> serviceImage = [];
  String? selectedItem = 'Select';

  changeSelectedItem(value) {
    selectedItem = value;
    customToast(selectedItem!);
    update();
  }
  getServiceList() async {
    customToast('Getting Service List');
    var response = await ApiService().getApiDatawithToken(url: serviceCatUrl);
    var jsonData = json.decode(response);
    if (jsonData['status'] == true) {
      for (var data in jsonData['data']) {
        serviceList.add(data['category_name']);
        serviceImage.add(data['category_image'].toString());
        update();
      }
    } else {
      customToast(response['Message']);
    }
  }
  goNext() {
    if (selectedItem == 'Select') {
      customToast('Please Select Service');
    } else if (uniqueSkillCtrl.text.isEmpty) {
      customToast('Please Enter Unique Skill');
    } else if (uniquePitch.text.isEmpty) {
      customToast('Please Enter Unique Picth');
    } else {
      moveRTL(screen: const ProviderPaymentFormView());
    }
  }

  @override
  void onInit() {
    getServiceList();
    super.onInit();
  }
}
