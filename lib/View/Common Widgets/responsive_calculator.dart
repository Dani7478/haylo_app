import 'package:flutter/material.dart';

double calculateFontSize(BuildContext context,double targetFontSize) {
  double targetWidth = 375;
  double targetHeight = 812;

  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  double widthRatio = screenWidth / targetWidth;
  double heightRatio = screenHeight / targetHeight;
  double scaleFactor = widthRatio < heightRatio ? widthRatio : heightRatio;

  double fontSize = targetFontSize * scaleFactor;
  return fontSize;
}