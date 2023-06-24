import 'dart:convert';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Services/api_service.dart';
import '../../../../Model/service_categories.dart';
import '../../../toast.dart';

class BookerServiceListController extends GetxController {
  bool isloading=true;
  List<ServiceCategories> services=[];


  getCategorizeUsers(int id) async {
    services.clear();
    String url = '$getUniqueServiceUrl$id';
    print(url);
    var response = await ApiService().getApiDatawithToken(url: url);
    var jsonData = json.decode(response);
    for(int i=0; i<jsonData['data'].length ; i++){
      ServiceCategories service= ServiceCategories.fromJson(jsonData['data'][i]);
      services.add(service);
    }
    isloading=false;
    update();
  }




}