import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/Services/local_storage.dart';

import '../../../Model/service.dart';
import '../../../Model/user_service.dart';
import '../../../View/Constants/images.dart';
import '../../api.dart';

class ProviderAddNewServiceController extends GetxController {
  TextEditingController serviceNameCtrl = TextEditingController();
  TextEditingController serviceDescriptionCtrl = TextEditingController();
  TextEditingController servicePriceCtrl = TextEditingController();
  bool loadingData = true;
  List<Services> serviceList = [];

  @override
  void onInit() {
    super.onInit();
    getAllProviderService();
  }

  fillData(Services service) {
    serviceNameCtrl.text = service.name!;
    serviceDescriptionCtrl.text = service.description!;
    servicePriceCtrl.text = service.perHourPrice.toString();
    update();
  }

  updateService(Services service) async {
    var data = {
      'action': 'edit',
      'name': serviceNameCtrl.text,
      'description': serviceDescriptionCtrl.text,
      'per_hour_price': servicePriceCtrl.text,
      'service_id': service.id.toString()
      // 'image':
      // 'service_id'
    };

    var response = await ApiService().postApiWithToken(data, postServiceCatUrl);
    print(response.toString());
    var jsonResponse = json.decode(response);
    customToast(jsonResponse['message']);
    getAllProviderService();
  }

  postNewService() async {
    var data = {
      'action': 'create',
      'name': serviceNameCtrl.text,
      'description': serviceDescriptionCtrl.text,
      'per_hour_price': servicePriceCtrl.text
      // 'image':
      // 'service_id'
    };

    var response = await ApiService().postApiWithToken(data, postServiceCatUrl);
    print('____________________');
    print(response);
    var jsonData = json.decode(response);
    if (jsonData['status'] == true) {
      customToast(jsonData['message']);
      getAllProviderService();
    } else {
      customToast(jsonData['message']);
    }
  }

  getAllProviderService() async {
    serviceList=[];
    var response = await ApiService()
        .postApiWithToken({'action': 'view'}, postServiceCatUrl);
    var jsonData = json.decode(response);
 print(jsonData['data']['data']);
    for (int i = 0; i < jsonData['data']['data'].length; i++) {
       Services service = Services.fromJson(jsonData['data']['data'][i]);
      serviceList.add(service);
      update();

    }
    loadingData=false;
    update();
  }

  deleteService(Services service) async {
    var data = {
      'action': 'delete',
      'service_id': service.id!,
    };
    var response = await ApiService().postApiWithToken(data, postServiceCatUrl);
    var jsonData=json.decode(response);
    customToast(jsonData['message']);
    getAllProviderService();
  }

  List<dynamic> servicelist = [
    {
      provideService1,
      'Service 2',
      'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
      30
    },
    {
      provideService1,
      'Service 2',
      'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
      75
    },
    {
      provideService1,
      'Service 3',
      'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing',
      75
    },
  ];
}
