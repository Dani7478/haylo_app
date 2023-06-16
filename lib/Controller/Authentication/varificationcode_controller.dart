import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/View/Common%20Widgets/navigate.dart';

import '../../View/Screens/Authentication/reset_password_view.dart';

class VarificationCodeController extends GetxController{


  List<TextEditingController> controllers = [];

  matchCode(String actualCode,) {
    String userCode = controllers[0].text + controllers[1].text +
        controllers[2].text + controllers[3].text + controllers[4].text;
    print(actualCode);
    print(userCode);
    if(actualCode==userCode){
      moveUTD(screen: const ResetPasswordView());
    }else {
      customToast('Not Match');
    }

  }
}