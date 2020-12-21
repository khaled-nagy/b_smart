import 'package:b_smart/src/screens/PermissionRequestScreen.dart';
import 'package:b_smart/src/screens/VacationRequestScreen.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';

class VacationOrPermissionScreen extends StatefulWidget {
  final String vacationOrPermission;
  VacationOrPermissionScreen({@required this.vacationOrPermission});
  @override
  createState() => VacationOrPermissionView();
}

class VacationOrPermissionView extends State<VacationOrPermissionScreen> {
  @override
  void initState() {
    // _newRequestsController.getAllLookups("vacation-types");
    // _newRequestsController.getAllLookups("permission-types");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(context: context),
        body: widget.vacationOrPermission == "vacation"
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Vacation(
                  vacationOrPermission: widget.vacationOrPermission,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Permission(
                  vacationOrPermission: widget.vacationOrPermission,
                ),
              ));
  }
}
