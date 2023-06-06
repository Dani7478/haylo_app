import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haylo_app/View/Constants/colors.dart';

class VerificationCodeInput extends StatefulWidget {
  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];
  final int codeLength = 5;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < codeLength; i++) {
      TextEditingController controller = TextEditingController();
      FocusNode focusNode = FocusNode();
      controllers.add(controller);
      focusNodes.add(focusNode);

      if (i < codeLength - 1) {
        controller.addListener(() {
          if (controller.text.length == 1) {
            focusNodes[i + 1].requestFocus();
          }
        });
      }
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < codeLength; i++) {
      controllers[i].dispose();
      focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        codeLength,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration:  InputDecoration(
                hintText: '-',
                hintStyle: TextStyle(
                  fontSize: 28.sp,
                  color: grayColor,
                ),
                counterText: '',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.length == 1 && index < codeLength - 1) {
                  focusNodes[index + 1].requestFocus();
                }
              },
              style: TextStyle(
                  fontSize: 24.sp,
                  color: blackTextColor,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
