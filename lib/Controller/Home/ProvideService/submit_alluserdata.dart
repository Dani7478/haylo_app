import 'dart:convert';

import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Services/api_service.dart';
import '../../controller_links.dart';
import 'provideraddnewservice_controller.dart';

class SubmitAllUserDataController extends GetxController {
  var basicProfileCtrl = Get.put(ProvideProfileFormController());
  var providerCatCtrl = Get.put(ProviderCategoryFormController());
  var payment1Ctrl = Get.put(ProviderPaymentFormController());
  var payment2Ctrl = Get.put(ProviderPaymentFormController2());
  var addServiceCtrl = Get.put(ProviderAddNewServiceController());

  @override
  void onInit() {
    super.onInit();
  }

  getAllUserData() async {
    Map<String, dynamic> alldata = {
      'first_name': basicProfileCtrl.firstNameCtrl.text,
      'last_name': basicProfileCtrl.lastNameCtrl.text,
      //'image': basicProfileCtrl.image.text,
      'unique_skills': providerCatCtrl.uniqueSkillCtrl.text,
      'unique_pitch': providerCatCtrl.uniquePitch.text,
      'gender': payment1Ctrl.selectedGender,
      'nationality': basicProfileCtrl.firstNameCtrl.text,
      'state': payment1Ctrl.stateCtrl.text,
      'city': payment1Ctrl.cityCtrl.text,
      'address': payment1Ctrl.addressCtrl.text,
      'postal_code': payment1Ctrl.postalCtrl.text,
      'national_id_ssn': payment1Ctrl.nationalIdCtrl.text,
      'bank_account_holder_name': payment2Ctrl.holderNameCtrl.text,
      'bank_name': payment2Ctrl.bankNameCtrl.text,
      'bank_account_number': payment2Ctrl.bankAccountNumberCtrl.text,
      'incorporation_date': payment2Ctrl.incorporationCtrl.text,
      'device_type': 'android',
      'fcm_token': 'FCM_TOKEN',
      'phone': payment1Ctrl.phonNoCtrl.text,
      'category_id': '1',
    };

    var responseData =
        await ApiService().postApiWithToken(alldata, updateProfile);
    var jsonData = json.decode(responseData);

    print(jsonData);
  }
}
