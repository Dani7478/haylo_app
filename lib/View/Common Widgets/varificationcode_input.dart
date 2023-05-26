import 'package:flutter/material.dart';
import 'package:haylo_app/View/Constants/colors.dart';

class VerificationCodeInput extends StatefulWidget {
  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
 // final TextEditingController _controller = TextEditingController();
 //  final FocusNode _focusNode = FocusNode();
  final int codeLength = 5;

  @override
  void initState() {
    super.initState();
   // // _focusNode.addListener(() {
   //    setState(() {}); // Trigger a rebuild when the focus changes
   //  }
   //  );
  }

  @override
  void dispose() {
    //_controller.dispose();
    //_focusNode.dispose();
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
            width: MediaQuery.of(context).size.width*0.12,
            height: MediaQuery.of(context).size.width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              //controller: _controller,
              //focusNode: _focusNode,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: const InputDecoration(
                hintText: '-',
                hintStyle: TextStyle(
                  fontSize: 28,
                  color: grayColor,
                ),
                counterText: '',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.length == 1 && index < codeLength - 1) {
                  // _focusNode.nextFocus();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
