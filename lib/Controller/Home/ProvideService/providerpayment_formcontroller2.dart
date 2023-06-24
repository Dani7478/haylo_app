import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/Home/ProvideService/provideraddnewservice_controller.dart';
import 'package:haylo_app/Controller/Home/ProvideService/providersubmit_alluserdata.dart';
import 'package:haylo_app/Controller/toast.dart';
import '../../../View/Common Widgets/navigate.dart';
import '../../../View/Screens/Home/ProvideService/provider_addnewservice_view.dart';
import '../../../View/Screens/Universal/all_done_view.dart';

class ProviderPaymentFormController2 extends GetxController {
  TextEditingController holderNameCtrl = TextEditingController();
  TextEditingController routingNumberCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController bankAccountNumberCtrl = TextEditingController();
  TextEditingController incorporationCtrl = TextEditingController();
  bool isLoading=false;

  goNext() async {
    isLoading=true;
    update();
    if (holderNameCtrl.text.isEmpty) {
      customToast('Please Enter Name');
    } else if (routingNumberCtrl.text.isEmpty) {
      customToast('Please Enter Routing Number');
    } else if (bankNameCtrl.text.isEmpty) {
      customToast('Please Enter Bank Name');
    } else if (bankAccountNumberCtrl.text.isEmpty) {
      customToast('Please Enter Bank Name');
    } else if (incorporationCtrl.text.isEmpty) {
      customToast('Please Enter incorporation date');
    } else {
      var controller=Get.put(ProviderSubmitAllUserDataController());
   bool result= await  controller.postUserData();
   if(result==true){
     moveUTD(screen: ProviderAddNewServiceView());
     //moveUTD(screen: PaymentDoneView(role: 'provider'));
     isLoading=false;
     update();
   } else {
     customToast('Please Enter Correct Data');
     isLoading=false;
     update();

   }


       // moveUTD(screen: const ProviderAddNewServiceView());
    }
  }
}
