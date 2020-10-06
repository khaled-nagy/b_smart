import 'package:flutter/material.dart';

class ButtonC extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final TextStyle textstyle;
  final Function onpress;
  final Color color;
  ButtonC ({
    this.onpress,this.textstyle,
    this.color,this.height,this.text,this.width
  });

  @override
  _ButtonCState createState() => _ButtonCState();
}

class _ButtonCState extends State<ButtonC> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.color,
      height: widget.height,
      width: widget.width,
      child: FlatButton(
        onPressed: widget.onpress,
        child: Text(widget.text,style:widget.textstyle ,),
      
      ),
    );
  }
}

// class ButtonW extends StatefulWidget {
//   final String buttonName;
//   final String buttonImage;
//   final double width;
//   final double height;
//   final Function function;
//   final int sochialOrNormal;
//   final int sendOrNot;

//   ButtonW(
//       {this.buttonName,
//       this.buttonImage,
//       this.height,
//       this.width,
//       this.function,
//       this.sochialOrNormal,
//       this.sendOrNot});
//   @override
//   _ButtonWState createState() => _ButtonWState();
// }

// class _ButtonWState extends State<ButtonW> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         height: widget.height,
//         width: widget.width,
//         child: Material(
//             color: widget.sendOrNot == 0
//                 ? Theme.of(context).accentColor
//                 : Theme.of(context).backgroundColor,
//             elevation: 0.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(22.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   widget.sochialOrNormal != 0
//                       ? Container(
//                           width: 0,
//                         )
//                       : Image.asset(
//                           widget.buttonImage,
//                           width: 25,
//                           height: 25,
//                         ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8),
//                     child: Text(
//                       widget.buttonName,
//                       style: widget.sendOrNot == 0
//                           ? Theme.of(context).textTheme.button
//                           : Theme.of(context).textTheme.headline3,
//                     ),
//                   ),
//                   widget.sochialOrNormal != 0
//                       ? Image.asset(
//                           widget.buttonImage,
//                           width: 25,
//                           height: 25,
//                         )
//                       : Container(
//                           width: 0,
//                         )
//                 ],
//               ),
//             )),
//       ),
//       onTap: widget.function,
//     );
//   }
// }
