import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/VacationController.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:b_smart/src/data/models/VacationModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Vacation extends StatefulWidget {
  final String vacationOrPermission;
  Vacation({this.vacationOrPermission});
  createState() => VacationState();
}

class VacationState extends StateMVC<Vacation> {
  VacationState() : super(VacationController()) {
    _vacationController = VacationController.con;
  }

  VacationController _vacationController;

  VacationModel selectedVacationId;

  void getReturnDate() {
    if (selectedVacationId == null) {
      Fluttertoast.showToast(
          msg: "please choose you vacation type",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (VacationController.vacationNumberController.text == "") {
      Fluttertoast.showToast(
          msg: "please enter your number of days",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (VacationController.vacationStartCalender == null) {
      Fluttertoast.showToast(
          msg: "please choose you start Date ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (VacationController.vacationEndCalender == null) {
      Fluttertoast.showToast(
          msg: "please choose you End Date ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _vacationController
          .returnDateRequest(
              _vacationController.newVacationModel.employeeId,
              VacationController.vacationTypeId,
              VacationController.vacationStartCalender.toString(),
              VacationController.vacationEndCalender.toString(),
              VacationController.vacationNumberController.text)
          .then((value) {
        VacationController.returnDate = value.substring(0, 10);
        setState(() {});
      });
    }
  }

  bool isLoadingVacation = false;

  @override
  void initState() {
    _vacationController.getAllLookups("vacation-types");
    ConstantVarable.requestType = "vacation";
    VacationController.vacationTypeId = 0;
    VacationController.vacationNumberController.text = "";
    VacationController.vacationEndCalenderController.text = "";
    VacationController.returnDate = "";

    _vacationController.getNewRequest("vacation");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<VacationRequest>(context);

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height / 1.2,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _vacationController.vacationList != null
                  ? Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton<VacationModel>(
                              hint: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  "_Vacation_type".tr(),
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              underline: Container(),
                              value: selectedVacationId,
                              iconSize: 30,
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              items: _vacationController.vacationList
                                  .map((VacationModel vacation) {
                                return DropdownMenuItem<VacationModel>(
                                    value: vacation,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        EasyLocalization.of(context).locale ==
                                                Locale("en")
                                            ? vacation.foreignName
                                            : vacation.localName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ));
                              }).toList(),
                              onChanged: (VacationModel value) {
                                setState(() {
                                  selectedVacationId = value;
                                  VacationController.vacationTypeId = value.id;
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
                    "_start_Date",
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
                      dateLabelText: '',
                      onChanged: (val) {
                        setState(() {
                          VacationController.vacationNumberController.text = "";
                          VacationController
                              .vacationEndCalenderController.text = "";
                          VacationController.returnDate = "";
                        });

                        VacationController.vacationStartCalender =
                            DateTime.parse(val);

                        VacationController.vacationStartDay =
                            int.parse(val.substring(8, 10));
                        VacationController.vacationStartMonth =
                            int.parse(val.substring(5, 7));
                        VacationController.vacationStartYear =
                            int.parse(val.substring(0, 4));

                        // ConstantVarable.vacationStartDay =
                        //     ConstantVarable.vacationEndDay;
                        // ConstantVarable.vacationStartMonth =
                        //     ConstantVarable.vacationEndMonth;
                        // ConstantVarable.vacationStartYear =
                        //     ConstantVarable.vacationEndYear;
                      },
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {},
                    ),
                  ),
                ],
              ),
              Container(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_Numers_of_Days",
                          style: Theme.of(context).textTheme.headline2)
                      .tr(),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16, right: 16),
                  //   child: new Text(prov.counter.toString()),
                  // ),
                  Container(
                    width: size.width / 4,
                    child: TextFormFieldW(
                      textInputType: TextInputType.number,
                      controller: VacationController.vacationNumberController,
                      validator: (val) =>
                          UserController().validateAnyFeild(context, val),
                      hintText: "0",
                      searchOrKnow: false,
                      obSecureText: false,
                      changes: (value) {
                        VacationController.vacationEndCalenderController.text =
                            VacationController.vacationStartCalender
                                .add(Duration(days: int.parse(value) - 1))
                                .toString();

                        VacationController.vacationEndCalender = DateTime.parse(
                            VacationController
                                .vacationEndCalenderController.text);

                        VacationController.vacationEndDay =
                            VacationController.vacationStartDay +
                                int.parse(value);

                        getReturnDate();
                      },
                      saved: (value) {},
                    ),
                  ),
                ],
              )),
              Container(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_End_Date".tr(),
                          style: Theme.of(context).textTheme.headline2)
                      .tr(),
                  VacationController.returnDate == ""
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: new Text(VacationController
                              .vacationEndCalenderController.text
                              .substring(0, 10)),
                        ),
                ],
              )),
              Container(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_return_date".tr(),
                          style: Theme.of(context).textTheme.headline2)
                      .tr(),
                  VacationController.returnDate == ""
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: new Text(VacationController.returnDate),
                        ),
                ],
              )),
              Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "_Notes",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: VacationController.vacationNotesController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "_Add_notes_Here".tr(),
                    searchOrKnow: false,
                    obSecureText: false,
                  ),
                ),
              ),
              widget.vacationOrPermission != null
                  ? isLoadingVacation == false
                      ? ButtonW(
                          borderradius: BorderRadius.circular(12),
                          width: size.width * 0.8,
                          text: "Save Request",
                          color: Theme.of(context).backgroundColor,
                          textstyle: Theme.of(context).textTheme.headline3,
                          onpress: () {
                            if (selectedVacationId == null) {
                              Fluttertoast.showToast(
                                  msg: "please choose you vacation type",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationController
                                    .vacationNumberController.text ==
                                "") {
                              Fluttertoast.showToast(
                                  msg: "please enter your number of days",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationController
                                    .vacationStartCalender ==
                                null) {
                              Fluttertoast.showToast(
                                  msg: "please choose you start Date ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationController.vacationEndCalender ==
                                null) {
                              Fluttertoast.showToast(
                                  msg: "please choose you End Date ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              setState(() {
                                isLoadingVacation = true;
                              });

                              _vacationController
                                  .postVacation(
                                      "vacation",
                                      selectedVacationId.id,
                                      VacationController
                                          .vacationNumberController.text,
                                      VacationController.vacationStartCalender
                                          .toString(),
                                      VacationController.vacationEndCalender
                                          .toString(),
                                      VacationController.returnDate,
                                      VacationController
                                          .vacationNotesController.text)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoadingVacation = false;
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
                                } else {
                                  setState(() {
                                    isLoadingVacation = false;
                                  });
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
      ),
    );
  }
}
