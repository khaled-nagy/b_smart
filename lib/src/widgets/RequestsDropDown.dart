import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/LookupsModel.dart';
import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectRequestType extends StatefulWidget {
  @override
  _SelectRequestTypeState createState() => _SelectRequestTypeState();
}

class _SelectRequestTypeState extends State<SelectRequestType> {
  LookupsModel selectedLookup;
  List<LookupsModel> lookupList = [
    LookupsModel(
        id: 1,
        foreignName: "vacation-types",
        localName: " Vacation Request",
        localNameAr: "طلب اجازة"),
    LookupsModel(
        id: 1,
        foreignName: "permission-types",
        localName: " Permission Request",
        localNameAr: "طلب اذن"),
    LookupsModel(
        id: 1,
        foreignName: "Assignment Change Request",
        localName: "Assignment Change Request",
        localNameAr: "طلب تغيير وظيفة"),
    LookupsModel(
        id: 1,
        foreignName: "Vacation Balance Adjustment",
        localName: "Vacation Balance Adjustment",
        localNameAr: " طلب تسوية رصيد الإجازة"),
    LookupsModel(
        id: 1,
        foreignName: "termination-types",
        localName: "Termination Request",
        localNameAr: "طلب إنهاء خدمة"),
    LookupsModel(
        id: 1,
        foreignName: "loan-types",
        localName: " Loan request",
        localNameAr: "طلب سلفة "),
    LookupsModel(
        id: 1,
        foreignName: "Payroll Adjustment Request",
        localName: "Payroll Adjustment Request",
        localNameAr: "طلب تسوية الراتب"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<SelectRequest>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<LookupsModel>(
                hint: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    "_Select_Request_Type".tr(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                underline: Container(),
                value: selectedLookup,
                iconSize: 30,
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down),
                items: lookupList.map((LookupsModel lookup) {
                  return DropdownMenuItem<LookupsModel>(
                      value: lookup,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          EasyLocalization.of(context).locale == Locale("en")
                              ? lookup.localName
                              : lookup.localNameAr,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ));
                }).toList(),
                onChanged: (LookupsModel value) {
                  setState(() {
                    selectedLookup = value;
                    prov.requesttype = value.foreignName;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
