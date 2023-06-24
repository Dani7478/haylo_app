import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:haylo_app/View/Constants/consts.dart';


class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: purpleColor,
      size: 50.0,
    );
  }
}
