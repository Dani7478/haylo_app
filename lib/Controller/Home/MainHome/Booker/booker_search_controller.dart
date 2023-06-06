import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookerSearchController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();
  List<String> suggestServicesList = [
    'Service 1',
    'Service 2',
    'Service 3',
    'Service 4',
    'Service 5'
  ];
}
