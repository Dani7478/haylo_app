import 'package:flutter/material.dart';
import 'package:haylo_app/View/Screens/Authentication/forgot_password.dart';
import 'package:haylo_app/View/Screens/Authentication/login_view.dart';
import 'package:haylo_app/View/Screens/Authentication/varification_code_view.dart';
import 'package:haylo_app/View/Screens/Home/onboarding_view.dart';
import 'package:get/get.dart';

import 'Controller/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haylo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      initialBinding: AllBindings(),
      routes: {
        '/': (context) => const OnboardingView(),
        //'/Login': (context) => const LoginView(),
      },
    );
  }
}
