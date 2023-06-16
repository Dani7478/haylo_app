
import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Services/api_service.dart';

import '../../../toast.dart';

class BookerServiceListController extends GetxController {

  getCategorizeUsers(int id) async {
    String url='$getCatUserUrl{$id}';
    print(url);
  var response=await  ApiService().getApiDatawithToken(url: url);
  // print(response.toString());
    customToast(response.toString());
  }

}