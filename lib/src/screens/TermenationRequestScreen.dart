import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/TermenationController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/data/models/TerminasionModel.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Termination extends StatefulWidget {
  createState() => _TerminationState();
}

class _TerminationState extends StateMVC<Termination> {
  _TerminationState() : super(TerminationController()) {
    _terminationController = TerminationController.con;
  }
  TerminationController _terminationController;

  TerminasionModel selectedTerminationt;
  @override
  void initState() {
    _terminationController.getAllLookups("termination-types");
    ConstantVarable.requestType = "termination";
    _terminationController.getNewRequest("termination");
    TerminationController.terminasionLastWorkinDayCalender =
        DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<TermnisionRequest>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: size.height / 1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<TerminasionModel>(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          "_Termination_Type".tr(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      underline: Container(),
                      value: selectedTerminationt,
                      iconSize: 30,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      items: _terminationController.terminationList
                          .map((TerminasionModel terminasion) {
                        return DropdownMenuItem<TerminasionModel>(
                            value: terminasion,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                EasyLocalization.of(context).locale ==
                                        Locale("en")
                                    ? terminasion.foreignName
                                    : terminasion.localName,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ));
                      }).toList(),
                      onChanged: (TerminasionModel value) {
                        setState(() {
                          selectedTerminationt = value;
                          TerminationController.terminationTypeId = value.id;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_last_Working_Day",
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
                    // controller: ConstantVarable.vacationStartCalender,
                    dateLabelText: '',
                    onChanged: (val) {
                      TerminationController.terminasionLastWorkinDayCalender =
                          val;
                    },
                    validator: (val) {
                      return null;
                    },
                    onSaved: (val) {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_Notes".tr(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                  width: size.width / 1.5,
                  child: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller:
                        TerminationController.terminasionNotescontroller,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "_Add_notes_Here".tr(),
                    searchOrKnow: false,
                    obSecureText: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
