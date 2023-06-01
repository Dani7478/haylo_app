

import 'package:get/get.dart';

class BookerAppBarController extends GetxController {
  String activeView='home';

  updateView(String view){
    activeView=view;
    print(activeView);
    update();
  }
}