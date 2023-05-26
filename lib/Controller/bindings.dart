import 'package:get/get.dart';
import 'package:haylo_app/Controller/Authentication/forgotpassword_controller.dart';
import 'package:haylo_app/Controller/Authentication/login_controller.dart';




class AllBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }

}