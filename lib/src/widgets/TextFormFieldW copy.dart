import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TextFormFieldW extends StatefulWidget {
  final TextInputType textInputType;
  TextEditingController controller;
  Function validator;
  Function changes;
  Function saved;
  bool obSecureText;
  String hintText;
  String image;
  bool searchOrKnow;
  final bool authOrNo;
  final bool aboutOrNo;

  TextFormFieldW({
    this.textInputType,
    this.controller,
    this.validator,
    this.changes,
    this.saved,
    this.obSecureText,
    this.hintText,
    this.image,
    this.searchOrKnow,
    this.authOrNo = false,
    this.aboutOrNo,
  });
  @override
  _TextFormFieldWState createState() => _TextFormFieldWState();
}

class _TextFormFieldWState extends State<TextFormFieldW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border:
          //     Border.all(width: 1, color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(12)),
      height: 50,
      child: Row(
        textDirection: ui.TextDirection.ltr,
        children: <Widget>[
          Padding(
            padding: widget.image != null
                ? const EdgeInsets.only(top: 0, right: 16, left: 16)
                : const EdgeInsets.only(top: 0, right: 2, left: 2),
            child: widget.image == null
                ? Container()
                : Image.asset(
                    widget.image,
                    width: 20,
                    height: 20,
                  ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: widget.textInputType,
                    maxLines: widget.aboutOrNo == true ? 4 : 1,
                    textDirection: ui.TextDirection.ltr,
                    controller: widget.controller,
                    validator: widget.validator,
                    obscureText: widget.obSecureText,
                    onChanged: widget.changes,
                    onSaved: widget.saved,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(right: 8.0, top: 0.0, left: 8),
                      hintText: widget.hintText,
                      hintStyle: widget.searchOrKnow == false
                          ? Theme.of(context).textTheme.bodyText2
                          : Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    height: widget.authOrNo == false ? 1 : 0,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
