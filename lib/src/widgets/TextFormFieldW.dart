import 'package:b_smart/ConstantVarables.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
        class TextFormFieldC extends StatelessWidget {
         final String labeltext; 
         final double width;
         final double height;
         TextFormFieldC({this.labeltext,this.height,this.width});
         @override
         Widget build(BuildContext context) {
            return Container(
                   width:  width,
                   height: height,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: labeltext,
                    labelStyle: Theme.of(context).textTheme.headline2,
                    filled: true,
             fillColor:Color(0xffE9F0FD) ,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color:Theme.of(context).backgroundColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color:Theme.of(context).backgroundColor))
                  ),
                ),
           );
         }
       }