import 'package:flutter/material.dart';

class ButtonW extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final TextStyle textstyle;
  final Function onpress;
  final Color color;
   
  final BorderRadiusGeometry borderradius;
  ButtonW ({
    this.onpress,this.textstyle,
    this.borderradius,
    
    this.color,this.height,this.text,this.width
  });

  @override
  _ButtonWState createState() => _ButtonWState();
}

class _ButtonWState extends State<ButtonW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color: widget.color,
          borderRadius: widget.borderradius,
      ) ,
     // color: widget.color,
      height: widget.height,
      width: widget.width,
      child: FlatButton(
        
        onPressed: widget.onpress,
        child: Text(widget.text,style:widget.textstyle ,),
      
      ),
    );
  }
}
     