import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/colors.dart';

// class CustomTextField extends StatefulWidget {
//   CustomTextField(
//       {super.key,
//       required this.controller,
//       required this.hintText,
//       required this.abscr});

//   final TextEditingController controller;
//   final String hintText;
//   final bool abscr;

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

//   final String emailPattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,7}$';
//   bool isEmailValid = true;

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {

//      bool validateEmail(String input) {
//     RegExp regex = RegExp(emailPattern);
//     return regex.hasMatch(input);
//   }
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: grayColor,
//           width: 1.0,
//         ),
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: TextField(
//         controller: widget.controller,
//         onSubmitted: (value) {
//           FocusScope.of(context).nextFocus();
//         },

//         onChanged: (value) {
//               setState(() {
//                 isEmailValid = validateEmail(value);
//               });
//             },
//         decoration: InputDecoration(
//            errorText: isEmailValid ? null : 'Invalid email address',
//             hintText: widget.hintText,
//             hintStyle:
//                 GoogleFonts.poppins(fontSize: 13.sp, color: Color(0xFF747474)),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             border: InputBorder.none,
//             suffixIcon: widget.abscr == true
//                 ?  Icon(
//                     Icons.remove_red_eye_outlined,
//                     color: grayColor,
//                     size: 20.sp,
//                   )
//                 : const SizedBox()),
//         obscureText: widget.abscr,
//       ),
//     );
//   }
// }

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.abscr,
      required this.pattern,
      required this.error,
      });

  final TextEditingController controller;
  final String hintText;
  final bool abscr;
  final String pattern;
  final String error;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool isEmailValid = true;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    bool isValidate(String input) {
      RegExp regex = RegExp(widget.pattern);
      return regex.hasMatch(input);
    }

    return Container(
    //  height: 50,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: grayColor,
      //     width: 1.0,
      //   ),
      //   borderRadius: BorderRadius.circular(15.0),
      // ),
      child: TextField(
        controller: widget.controller,
        onSubmitted: (value) {
          FocusScope.of(context).nextFocus();
        },
        onChanged: (value) {
          setState(() {
            isEmailValid = isValidate(value);
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            errorText: isEmailValid ? null : widget.error,
            hintText: widget.hintText,
            hintStyle:
                GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black26),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
           // border: InputBorder.none,
            suffixIcon: widget.abscr == true
                ? Icon(
                    Icons.remove_red_eye_outlined,
                    color: grayColor,
                    size: 20.sp,
                  )
                : const SizedBox()),
        obscureText: widget.abscr,
      ),
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
    );
  }
}
