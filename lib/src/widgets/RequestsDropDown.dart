import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectRequestType extends StatefulWidget {
  @override
  _SelectRequestTypeState createState() => _SelectRequestTypeState();
}

class _SelectRequestTypeState extends State<SelectRequestType> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<SelectRequest>(context);
    print(prov.requestType);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 2.0,
        child: new Container(
          height: 50.0,
          width: size.width,
          child: DropdownButton(
            value: prov.requestType  ,
            isExpanded: true,
            items: [
              DropdownMenuItem(
                child: Text(" Vacation Request"),
                value: "Vacation Request",
              ),
              DropdownMenuItem(
                child: Text(" Permission Request"),
                value: "Permission Request",
              ),
              DropdownMenuItem(
                child: Text(" Assignment Change Request"),
                value: "Assignment Change Request",
              ),
              DropdownMenuItem(
                child: Text(" Vacation Balance Adjustment Request"),
                value: "Vacation Balance Adjustment Request",
              ),
              DropdownMenuItem(
                child: Text(" Termination Request"),
                value: "Termination Request",
              ),
              DropdownMenuItem(
                child: Text(" Loan request"),
                value: "Loan request",
              ),
              DropdownMenuItem(
                child: Text(" Payroll Adjustment Request"),
                value: "Payroll Adjustment Request",
              ),
            ],
            onChanged: (value) {
              setState(() {
                prov.requestType = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
