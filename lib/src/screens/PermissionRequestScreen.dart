import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/PermissionController.dart';
import 'package:b_smart/src/data/models/PermissionIdModel.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

// forms types

class Permission extends StatefulWidget {
  final String vacationOrPermission;
  Permission({this.vacationOrPermission});
  createState() => PermissionState();
}

class PermissionState extends StateMVC<Permission> {
  PermissionState() : super(PermissionController()) {
    _permissionController = PermissionController.con;
  }

  PermissionController _permissionController;

  PermissionModel selectedPermissoonId;
  bool isLoadingPermission = false;
  @override
  void initState() {
    _permissionController.getAllLookups("permission-types");
    ConstantVarable.requestType = "permission";
    PermissionController.permissionDate =
        DateTime.now().toString().substring(0, 10);
    _permissionController.getNewRequest("permission");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<PermissionRequest>(context);
    return SingleChildScrollView(
      child: Container(
        height: size.height / 1.2,
        width: size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _permissionController.permissionList != null
                ? Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton<PermissionModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "_permission_type".tr(),
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            underline: Container(),
                            value: selectedPermissoonId,
                            iconSize: 30,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
                            items: _permissionController.permissionList
                                .map((PermissionModel permission) {
                              return DropdownMenuItem<PermissionModel>(
                                  value: permission,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      EasyLocalization.of(context).locale ==
                                              Locale("en")
                                          ? permission.foreignName
                                          : permission.localName,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (PermissionModel value) {
                              setState(() {
                                selectedPermissoonId = value;
                                PermissionController.permissionTypeId =
                                    value.id;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : CircularProgressIndicator(
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_Premission_Date",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2,
                  child: DateTimePicker(
                    cursorColor: Theme.of(context).backgroundColor,

                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2021),
                    icon: Icon(Icons.calendar_today_rounded),
                    // controller: PermissionController.vacationStartCalender,
                    dateLabelText: '',
                    onChanged: (val) {
                      PermissionController.permissionDate = val;
                    },
                    validator: (val) {
                      return null;
                    },
                    onSaved: (val) {},
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                TimeOfDay picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                  builder: (BuildContext context, Widget child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child,
                    );
                  },
                );

                PermissionController.permissionStartTimeHours = picked.hour;
                PermissionController.permissionStartTimeMinuts = picked.minute;
                PermissionController.permissionEndTimeMinuts = 0;

                PermissionController.permissionEndTimeHours = 0;
                PermissionController.permissionDurationController.text = "0";
                PermissionController.permissionStartTime =
                    "${PermissionController.permissionStartTimeHours}:${PermissionController.permissionStartTimeMinuts}";

                setState(() {});
              },
              child: Row(
                children: [
                  Text(
                    "_start_time",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    width: 32,
                  ),
                  Text(
                    "${PermissionController.permissionStartTimeHours}:${PermissionController.permissionStartTimeMinuts}",
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("_Duration", style: Theme.of(context).textTheme.headline2)
                    .tr(),
                SizedBox(
                  width: size.width * 0.040,
                ),
                Container(
                  width: size.width / 4,
                  child: TextFormFieldW(
                    textInputType: TextInputType.number,
                    controller:
                        PermissionController.permissionDurationController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "0",
                    searchOrKnow: false,
                    obSecureText: false,
                    changes: (value) {
                      int sumMinutes =
                          PermissionController.permissionStartTimeMinuts +
                              int.parse(value);

                      if (sumMinutes >= 540) {
                        int subMinutes = sumMinutes - 540;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 9;
                      } else if (sumMinutes >= 480) {
                        int subMinutes = sumMinutes - 480;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 8;
                      } else if (sumMinutes >= 420) {
                        int subMinutes = sumMinutes - 420;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 7;
                      } else if (sumMinutes >= 360) {
                        int subMinutes = sumMinutes - 360;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 6;
                      } else if (sumMinutes >= 300) {
                        int subMinutes = sumMinutes - 300;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 5;
                      } else if (sumMinutes >= 240) {
                        int subMinutes = sumMinutes - 240;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 4;
                      } else if (sumMinutes >= 180) {
                        int subMinutes = sumMinutes - 180;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 3;
                      } else if (sumMinutes >= 120) {
                        int subMinutes = sumMinutes - 120;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 2;
                      } else if (sumMinutes >= 60) {
                        int subMinutes = sumMinutes - 60;
                        PermissionController.permissionEndTimeMinuts =
                            subMinutes;
                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours + 1;
                      } else {
                        PermissionController.permissionEndTimeMinuts =
                            PermissionController.permissionStartTimeMinuts +
                                int.parse(value);

                        PermissionController.permissionEndTimeHours =
                            PermissionController.permissionStartTimeHours;
                      }
                      PermissionController.permissionEndTime =
                          "${PermissionController.permissionEndTimeHours}:${PermissionController.permissionEndTimeMinuts}";
                    },
                  ),
                ),
                Text("_Minute").tr()
              ],
            ),
            Row(
              children: [
                Text(
                  "_end_Time",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: 32,
                ),
                Text(
                  "${PermissionController.permissionEndTimeHours}:${PermissionController.permissionEndTimeMinuts}",
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
            Container(
              height: 80.0,
              child: ListTile(
                leading: Text(
                  "_Notes",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                title: TextFormFieldW(
                  textInputType: TextInputType.text,
                  controller: PermissionController.permissionNotesController,
                  validator: (val) =>
                      UserController().validateAnyFeild(context, val),
                  hintText: "_Add_notes_Here".tr(),
                  searchOrKnow: false,
                  obSecureText: false,
                ),
              ),
            ),
            widget.vacationOrPermission != null
                ? isLoadingPermission == false
                    ? ButtonW(
                        borderradius: BorderRadius.circular(12),
                        width: size.width * 0.8,
                        text: "Save Request",
                        color: Theme.of(context).backgroundColor,
                        textstyle: Theme.of(context).textTheme.headline3,
                        onpress: () {
                          if (selectedPermissoonId == null) {
                            Fluttertoast.showToast(
                                msg: "please choose your Permission type",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (PermissionController.permissionDate ==
                              "") {
                            Fluttertoast.showToast(
                                msg: "please choose your date ",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (PermissionController.permissionStartTime ==
                              "00") {
                            Fluttertoast.showToast(
                                msg: "please choose you start Time ",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (PermissionController
                                  .permissionDurationController.text ==
                              "0") {
                            Fluttertoast.showToast(
                                msg: "please enter your duration ",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (PermissionController.permissionEndTime ==
                              "00") {
                            Fluttertoast.showToast(
                                msg: "please choose you End Time ",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            setState(() {
                              isLoadingPermission = true;
                            });
                            _permissionController
                                .postPermission(
                                    "permission",
                                    selectedPermissoonId.id,
                                    PermissionController.permissionDate,
                                    PermissionController
                                        .permissionDurationController.text,
                                    PermissionController.permissionStartTime,
                                    PermissionController.permissionEndTime,
                                    PermissionController
                                        .permissionNotesController.text)
                                .then((value) {
                              if (value == true) {
                                setState(() {
                                  isLoadingPermission = false;
                                });
                                Fluttertoast.showToast(
                                    msg: "Request submitted successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
                              }
                            });
                          }
                        },
                      )
                    : CircularProgressIndicator(
                        backgroundColor: Theme.of(context).backgroundColor,
                      )
                : Container(
                    height: 50,
                  ),
          ],
        ),
      ),
    );
  }
}
