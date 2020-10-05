import 'package:flutter/material.dart';

class DrawerCard extends StatefulWidget {
  final String image;
  final String title;
  final Function function;
  DrawerCard({this.image, this.title, this.function});
  @override
  _DrawerCardState createState() => _DrawerCardState();
}

class _DrawerCardState extends State<DrawerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Image.asset(
                widget.image,
                width: 30,
                height: 30,
              ),
            ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
        onTap: widget.function,
      ),
    );
  }
}
