// ignore_for_file: unnecessary_brace_in_string_interps
import 'dart:convert';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Home/splash_screen.dart';
import '../../../../Model/user.dart';
import '../../../../Services/api_service.dart';
import '../../../Authentication/login_controller.dart';
import '../../../api.dart';
import 'package:intl/intl.dart';


class ProviderProfileController extends GetxController {
  String? userName='loading';
  

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  getUserData() async {
    User? user = await LocalStorage().getUserData();
    userName = "${user!.firstName} ${user.lastName}";
    update();
  }

 

  

  logoutUser() async {
    var response = await ApiService().getApiDatawithToken(url: logoutUrl);
    var jsonResponse = json.decode(response.toString());
    print('logout Response ${jsonResponse.toString()}');
    if (jsonResponse['status'] == true) {
      customToast('Logout');
      LocalStorage().clearCache();
      LocalStorage().clearCache();
      Get.find<LoginController>().emailCtrl.text='';
      Get.find<LoginController>().passwrdCtrl.text='';
      moveUTD(screen: const LoginView());
    } else {
      customToast('Somehting went wrong');
    }
  }
}
