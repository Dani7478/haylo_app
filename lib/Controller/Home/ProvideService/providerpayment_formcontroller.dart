
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderPaymentFormController extends GetxController {
  TextEditingController phonNoCtrl=TextEditingController();
  TextEditingController stateCtrl=TextEditingController();
  TextEditingController cityCtrl=TextEditingController();
  TextEditingController addressCtrl=TextEditingController();
  TextEditingController postalCtrl=TextEditingController();
  TextEditingController nationalIdCtrl=TextEditingController();

  List<String> genderList=['Select','Male','Female'];
  String selectedGender='Select';

  List<String> nationalityList=['Select','Pakistan','Austrailia', 'USA', 'Canada'];
  String selectedNationality='Select';




}