import 'package:flutter/material.dart';

class DropDownW extends StatelessWidget {
    final List<DropdownMenuItem<dynamic>> items;
    final Function onchanged;
      final Widget hint;
      final bool isexpanded;
    final double height;
    final double width;
     DropDownW({this.items,this.onchanged,this.hint,this.isexpanded,this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
       child: DropdownButton(
         underline: Container(),
         items: items, onChanged:onchanged  , hint:hint ,isExpanded: isexpanded,

       ),
    );
  }
}