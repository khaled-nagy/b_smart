import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
           var size =MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).accentColor,
      height: 50.0,
     width: size.width *0.88,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(underline: Container(),
           isDense: true,
          onChanged: (value) {},isExpanded: true,
          items: [
            DropdownMenuItem(
              child: Text("English"),
            ),
            DropdownMenuItem(
              child: Text("العربيه"),
            ),
            

          ],
        ),
      ),
    );
  }
}
