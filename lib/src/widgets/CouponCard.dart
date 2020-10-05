import 'package:flutter/material.dart';

class CouponCard extends StatefulWidget {
  final Map<String, dynamic> data;
  CouponCard({this.data});
  @override
  _CouponCardState createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
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
                    widget.data["transaction_amount"].toString() + " ر.س ",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    widget.data["transaction_date"].toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              Text(
                widget.data["transaction_details"].toString(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                widget.data["transaction_status"].toString(),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
