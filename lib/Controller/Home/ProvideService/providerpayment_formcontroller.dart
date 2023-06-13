import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';

import '../../../View/Common Widgets/navigate.dart';
import '../../../View/Screens/Home/ProvideService/provider_paymentform_view2.dart';

class ProviderPaymentFormController extends GetxController {
  TextEditingController phonNoCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController postalCtrl = TextEditingController();
  TextEditingController nationalIdCtrl = TextEditingController();

  List<String> genderList = ['Select', 'Male', 'Female'];
  String selectedGender = 'Select';

  List<String> nationalityList = [
    'Select',
    'Pakistan',
    'Austrailia',
    'USA',
    'Canada'
  ];
  String selectedNationality = 'Select';

  changeGender({gneder}) {
    selectedGender = gneder;
    customToast(gneder);
    update();
  }

  changeNationality({nationality}) {
    selectedNationality = nationality;
    update();
  }

  goNext() {
    if (phonNoCtrl.text.isEmpty) {
      customToast('please Enter Phone Number');
    } else if (selectedGender == 'Select') {
      customToast('please Select Gender');
    } else if (selectedNationality == 'Select') {
      customToast('please Select Nationality');
    } else if (stateCtrl.text.isEmpty) {
      customToast('please Select State');
    } else if (cityCtrl.text.isEmpty) {
      customToast('please Select City');
    } else if (addressCtrl.text.isEmpty) {
      customToast('please Select Address');
    } else if (postalCtrl.text.isEmpty) {
      customToast('please Select Postal code');
    } else if (nationalIdCtrl.text.isEmpty) {
      customToast('please Select National Id');
    } else {
      moveUTD(screen: const ProviderPaymentFormView2());
    }
  }
}
