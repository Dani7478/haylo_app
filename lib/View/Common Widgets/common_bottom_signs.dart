import 'package:flutter/material.dart';
import 'package:haylo_app/View/Common%20Widgets/widgets_links.dart';

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
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),
        ),
        const SizedBox(
          width: 8,
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
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
