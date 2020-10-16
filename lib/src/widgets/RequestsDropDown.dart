import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
class SelectRequestType extends StatefulWidget {
  @override
  _SelectRequestTypeState createState() => _SelectRequestTypeState();
}

class _SelectRequestTypeState extends State<SelectRequestType> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<SelectRequest>(context);
    print(prov.requesttype);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 2.0,
        child: new Container(
          height: 50.0,
          width: size.width,
          
          child: DropdownButton(
            underline: Container(),
            hint: Text("_Select_Request_Type").tr(),
            value: prov.requesttype ,
            isExpanded: true,
            items: [
              DropdownMenuItem(
                child: Text("_Vacation_request").tr(),
                value: "Vacation Request",
              ),
              DropdownMenuItem(
                child: Text("_Permission_Request").tr(),
                value: "Permission Request",
              ),
              DropdownMenuItem(
                child: Text("_Assignment_Change_Request").tr(),
                value: "Assignment Change Request",
              ),
              DropdownMenuItem(
                child: Text("_Vacation_Balance_Request").tr(),
                value: "Vacation Balance Adjustment Request",
              ),
              DropdownMenuItem(
                child: Text("_termination_Request").tr(),
                value: "Termination Request",
              ),
              DropdownMenuItem(
                child: Text("_loan_Request").tr(),
                value: "Loan request",
              ),
              DropdownMenuItem(
                child: Text("_Payroll_Adjustment_Request").tr(),
                value: "Payroll Adjustment Request",
              ),
            ],
            onChanged: (value) {
              
                prov.requesttype = value;
              
            },
          ),
        ),
      ),
    );
  }
}
