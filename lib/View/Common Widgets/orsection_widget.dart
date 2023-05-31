
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import 'common_text.dart';

class OrSection extends StatelessWidget {
   OrSection({super.key, required this.text});
   String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        children: [
          const Expanded(
            flex: 30,
            child: Divider(
              color: grayColor,
              thickness: 2,
            ),
          ),
          Expanded(
              flex: 40,
              child: Center(child: CommonText(text: text!))),
          const Expanded(
            flex: 30,
            child: Divider(
              color: grayColor,
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }
}
