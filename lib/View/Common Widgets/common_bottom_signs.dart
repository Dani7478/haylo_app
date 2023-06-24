import 'package:flutter/material.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';
import 'package:haylo_app/View/Constants/colors.dart';

import '../Screens/Home/signup_selection.dart';

class CommonBottomSings extends StatelessWidget {
  CommonBottomSings(
      {Key? key,
      required this.firsttext,
      required this.lasttext,
      required this.navigate})
      : super(key: key);
  String? firsttext;
  String? lasttext;
  Widget navigate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          firsttext!,
          style: const TextStyle(
              color: purpleColor, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 0,
        ),
        TextButton(
            onPressed: () {
            moveUTD(screen: navigate);
            },
            child:  Text(
              lasttext!,
              style:  const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
