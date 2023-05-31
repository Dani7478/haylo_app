import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookProfileFormController extends GetxController {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isTermsOk=false;
}
