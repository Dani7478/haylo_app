import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/ProvideService/providersubmit_alluserdata.dart';
import 'package:haylo_app/Controller/toast.dart';
import '../../../View/Common Widgets/navigate.dart';
import '../../../View/Screens/Home/ProvideService/provider_addnewservice_view.dart';

class ProviderPaymentFormController2 extends GetxController {
  TextEditingController holderNameCtrl = TextEditingController();
  TextEditingController routingNumberCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController bankAccountNumberCtrl = TextEditingController();
  TextEditingController incorporationCtrl = TextEditingController();

  goNext() {
    if (holderNameCtrl.text.isEmpty) {
      customToast('Please Enter Name');
    } else if (routingNumberCtrl.text.isEmpty) {
      customToast('Please Enter Routing Number');
    } else if (bankNameCtrl.text.isEmpty) {
      customToast('Please Enter Bank Name');
    } else if (bankAccountNumberCtrl.text.isEmpty) {
      customToast('Please Enter Bank Name');
    } else if (incorporationCtrl.text.isEmpty) {
      customToast('Please Enter icorporation date');
    } else {
      var controller=Get.put(ProviderSubmitAllUserDataController());
      controller.postUserData();
       // moveUTD(screen: const ProviderAddNewServiceView());
    }
  }
}
