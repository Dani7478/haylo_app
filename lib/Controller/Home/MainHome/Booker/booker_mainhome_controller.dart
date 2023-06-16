import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Services/local_storage.dart';
import '../../../../Model/service.dart';
import '../../../../Model/user.dart';
import '../../../../Services/api_service.dart';

class BookerMainHomeController extends GetxController {

   bool loadingData = true;
   List<Service> serviceList=[];
   User? user;

  @override
  void onInit() {
    gettingAllData();
    super.onInit();
  }


  gettingAllData() async  {
  serviceList= await ApiService().getAllServices();
  user= await LocalStorage().getUserData();
  loadingData=false;
  update();
  }


}
