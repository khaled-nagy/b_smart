import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_smart/src/statemanagment/Change_Language.dart';
class DropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
           var size =MediaQuery.of(context).size;
           var prov= Provider.of<ChangeLanguage>(context);
           print(prov.language);
    return Container(
      color: Theme.of(context).accentColor,
      height: 50.0,
     width: size.width *0.88,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(underline: Container(),
           isDense: true,
           value: prov.language,
          onChanged: (value) {
          prov.language= value  ;
          },isExpanded: true,
          items: [
            DropdownMenuItem(
              child: Text("English"),
              value: "English",
            ),
            DropdownMenuItem(
              child: Text("العربيه"),
              value:"العربيه" ,
            ),
            

          ],
        ),
      ),
    );
  }
}
