import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareW extends StatefulWidget {
  final String title;
  final String image;
  ShareW({this.title, this.image});
  @override
  _ShareWState createState() => _ShareWState();
}

class _ShareWState extends State<ShareW> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.share,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          final RenderBox box = context.findRenderObject();

          Share.share(
              "${widget.title} . "
              ""
              "Advertis Image : ${widget.image}",
              subject: widget.title,
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        });
  }
}
