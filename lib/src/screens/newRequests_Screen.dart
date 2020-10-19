import 'package:b_smart/src/controllers/newRequestsController.dart';
import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/RequestForm.dart';
import 'package:b_smart/src/widgets/RequestsDropDown.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

class NewRequests extends StatefulWidget {
  @override
  createState() => NewRequestsView();
}

class NewRequestsView extends StateMVC<NewRequests> {
  NewRequestsView() : super(NewRequestsController()) {
    _newRequestsController = NewRequestsController.con;
  }
  NewRequestsController _newRequestsController;

  @override
  void initState() {
    _newRequestsController.getAllLookups("vacation-types");
    _newRequestsController.getAllLookups("permission-types");
    _newRequestsController.getAllLookups("termination-types");
    _newRequestsController.getAllLookups("loan-types");
    _newRequestsController.getAllLookups("locations");
    _newRequestsController.getAllLookups("departments");
    _newRequestsController.getAllLookups("positions");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SelectRequest>(context);
    return Scaffold(
      appBar: appbar(
        context: context,
      ),
      body: SingleChildScrollView(
        child: new Column(
          children: [
            Padding(padding: const EdgeInsets.all(10.0), child: Container()),
            SelectRequestType(),
            SizedBox(
              height: 20.0,
            ),
            prov.requesttype == "vacation-types"
                ? Vacation()
                : prov.requesttype == "permission-types"
                    ? Permission()
                    : prov.requesttype == "Assignment Change Request"
                        ? Assignment()
                        : prov.requesttype ==
                                "Vacation Balance Adjustment Request"
                            ? VacationBalance()
                            : prov.requesttype == "termination-types"
                                ? Termination()
                                : prov.requesttype == "loan-types"
                                    ? Loan()
                                    : prov.requesttype ==
                                            "Payroll Adjustment Request"
                                        ? PayrollAdjustment()
                                        : Container()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).backgroundColor,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            "Save Request",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
