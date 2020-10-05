import 'package:flutter/material.dart';

class ButtonBack extends StatefulWidget {
  @override
  _ButtonBackState createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
