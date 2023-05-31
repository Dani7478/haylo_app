import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/colors.dart';

class CustomDropdownWidget extends StatefulWidget {
   List<String> itemList;
  String selectedItem;


  CustomDropdownWidget({required this.itemList,required this.selectedItem});

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: grayColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 21.w, vertical: 3.h),
        child: DropdownButton<String>(
          underline: SizedBox(),
          value: widget.selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              widget.selectedItem = newValue!;
            });
          },
          items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
