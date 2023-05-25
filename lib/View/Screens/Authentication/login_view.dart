import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, Welcome Back',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset('assets/images/hands.png'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
