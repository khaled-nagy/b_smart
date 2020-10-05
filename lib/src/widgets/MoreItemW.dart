import 'package:flutter/material.dart';

class MoreItemW extends StatefulWidget {
  final String image;
  final String title;
  final Function function;
  final bool last;
  MoreItemW({this.image, this.title, this.function, this.last});
  @override
  _MoreItemWState createState() => _MoreItemWState();
}

class _MoreItemWState extends State<MoreItemW> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage(widget.image), fit: BoxFit.cover)),
              child: Image.asset(
                widget.image,
                width: 30,
                height: 30,
              ),
            ),
            Container(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/imgs/Group 16@3x.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: widget.last == false
                      ? Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width / 1.6,
                          decoration: BoxDecoration(
                            color: Color(0xff727C8E),
                          ),
                        )
                      : Container(),
                )
              ],
            )
          ],
        ),
        onTap: widget.function,
      ),
    );
  }
}
