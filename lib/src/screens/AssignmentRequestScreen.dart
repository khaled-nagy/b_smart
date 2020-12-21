import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/AssignmentController.dart';
import 'package:b_smart/src/data/models/DepartmentModel.dart';
import 'package:b_smart/src/data/models/LocationModel.dart';
import 'package:b_smart/src/data/models/PositionModel.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class Assignment extends StatefulWidget {
  createState() => _AssignmentState();
}

class _AssignmentState extends StateMVC<Assignment> {
  _AssignmentState() : super(AssignmentController()) {
    _assignmentController = AssignmentController.con;
  }
  AssignmentController _assignmentController;

  LocationModel selectedlocation;

  DepartmentModel selectedDepartment;

  PositionModel selectedPosition;
  @override
  void initState() {
    _assignmentController.getAllLookups("locations");
    _assignmentController.getAllLookups("departments");
    _assignmentController.getAllLookups("positions");
    ConstantVarable.requestType = "assignmentChange";
    _assignmentController.getNewRequest("assignmentChange");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: 470,
        width: size.width * 0.9,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_New_LOcation",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<LocationModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_Location",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectedlocation,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          items: _assignmentController.locationList
                              .map((LocationModel location) {
                            return DropdownMenuItem<LocationModel>(
                                value: location,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    EasyLocalization.of(context).locale ==
                                            Locale("en")
                                        ? location.foreignName
                                        : location.localName,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (LocationModel value) {
                            setState(() {
                              selectedlocation = value;
                              AssignmentController.locationId = value.id;
                            });
                          }),
                    )),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_New_Department",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<DepartmentModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_Department",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectedDepartment,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          items: _assignmentController.departmentList
                              .map((DepartmentModel department) {
                            return DropdownMenuItem<DepartmentModel>(
                                value: department,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    EasyLocalization.of(context).locale ==
                                            Locale("en")
                                        ? department.foreignName
                                        : department.localName,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (DepartmentModel value) {
                            setState(() {
                              selectedDepartment = value;
                              AssignmentController.departmentId = value.id;
                            });
                          }),
                    )),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_New_Postion",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<PositionModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_Position",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectedPosition,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          items: _assignmentController.positionList
                              .map((PositionModel position) {
                            return DropdownMenuItem<PositionModel>(
                                value: position,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    EasyLocalization.of(context).locale ==
                                            Locale("en")
                                        ? position.foreignName
                                        : position.localName,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (PositionModel value) {
                            setState(() {
                              selectedPosition = value;
                              AssignmentController.positionId = value.id;
                            });
                          }),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
