// import 'package:flutter/material.dart';

// class DropDownButtonW extends StatefulWidget {
//   var model;
//   String dropDownTitle;
//   var selectedValueModel;
//   DropDownButtonW({this.model, this.dropDownTitle , this.selectedValueModel});
//   @override
//   _DropDownButtonWState createState() => _DropDownButtonWState();
// }

// class _DropDownButtonWState extends State<DropDownButtonW> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         width: MediaQuery.of(context).size.width / 2,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             // border: Border.all(color: Colors.grey[500]
//             // ),
//             borderRadius: BorderRadius.circular(12)),
//         child: Row(
//           children: <Widget>[
//             DropdownButton<widget.model>(
//                 hint: Padding(
//                   padding: const EdgeInsets.only(left: 8, right: 8),
//                   child: Text(
//                     dropDownTitleCity,
//                     style: Theme.of(context).textTheme.headline5,
//                   ),
//                 ),
//                 underline: Container(),
//                 value: selectedCity,
//                 iconSize: 30,
//                 icon: Padding(
//                     padding: const EdgeInsets.only(left: 18),
//                     child: Icon(Icons.arrow_drop_down)),
//                 items:
//                     _myAttendanceController.monthlist.map((MonthModel month) {
//                   return DropdownMenuItem<MonthModel>(
//                       value: month,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8, right: 8),
//                         child: Text(
//                           month.name,
//                           style: Theme.of(context).textTheme.headline,
//                         ),
//                       ));
//                 }).toList(),
//                 onChanged: (MonthModel value) {
//                   setState(() {
//                     selectedCity = value;
//                   });
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
