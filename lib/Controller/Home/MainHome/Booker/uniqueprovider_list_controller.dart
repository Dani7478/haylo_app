import 'dart:convert';

import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Model/booker_home_model.dart';
import 'package:haylo_app/Model/uniquecategory_model.dart';
import 'package:haylo_app/Services/api_service.dart';

import '../../../../Model/service_categories.dart';

class UniqueProviderControllers extends GetxController {
  bool isLoading = true;
  List<UniqueCategoryModel> uniqueCategories = [];

  getAllUniqueProviders(int id) async {
    uniqueCategories.clear();
    var url = '$getCatUserUrl$id';
    var response = await ApiService().getApiDatawithToken(url: url);
    var jsonData = json.decode(response);
    if (jsonData['status'] == true) {
      for (int i = 0; i < jsonData['data'].length; i++) {
        UniqueCategoryModel category =
            UniqueCategoryModel.fromJson(jsonData['data'][i]);
        uniqueCategories.add(category);
      }
      isLoading = false;
      update();
    } else {
      customToast(jsonData['message']);
      isLoading = false;
      update();
    }
    print('Length...........${uniqueCategories.length}');
  }
}
