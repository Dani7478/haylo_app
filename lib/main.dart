import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haylo_app/View/Screens/Home/ProvideService/provider_edit_services.dart';
import 'Controller/Home/ProvideService/provideraddnewservice_controller.dart';
import 'Controller/bindings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'View/Screens/Authentication/login_view.dart';
import 'View/Screens/Home/ProvideService/provider_addnewservice_view.dart';
import 'View/Screens/Home/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Haylo App',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          initialRoute: '/',
          initialBinding: AllBindings(),
          routes: {
            '/': (context) =>  const SplashScreen()
            //'/Login': (context) => const LoginView(),
          },
        );
      },
    );
  }
}
