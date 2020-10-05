import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "2630 ر.س",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "2020-08-27",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    "#85	",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "اسنان الماس",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    "اسنان الماس",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Text(
                        "Q30aKze",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "اسم العميل",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        "اسم المشهور",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
