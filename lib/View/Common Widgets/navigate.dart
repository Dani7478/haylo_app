import 'package:get/get.dart';


void moveLTR({var screen}){
  Get.to(
    screen,
    transition: Transition.leftToRight,
    duration: const Duration(milliseconds: 800),
  );
}

void moveRTL({var screen}){
  Get.to(
    screen,
    transition: Transition.rightToLeft,
    duration: const Duration(milliseconds: 800),
  );
}


void moveUTD({var screen}){
  Get.to(
    screen,
    transition: Transition.upToDown,
    duration: const Duration(milliseconds: 800),
  );
}