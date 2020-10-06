
import 'package:flutter/material.dart';

class Scaletransition  extends PageRouteBuilder {
  final Widget screen;
  Scaletransition({this.screen})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              screen,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.slowMiddle,
              ),
            ),
            child: child,
          ),
        );
}