import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VacationRequest extends ChangeNotifier {
  String _type;
    String  get vacationTypeID   {
         return _type;
  }
  set vacationTypeID(String type) {
             this._type = type;
             notifyListeners();
  }
  int counter = 0;
  increament(){
    counter++;
    notifyListeners();
  }
  discreament(){
     if(counter!= 0){
       counter--;
     }
    notifyListeners();
  }
 
}

class PermissionRequest extends ChangeNotifier {
  String _permissionTypeID;
    String  get permisionTypeID   {
         return _permissionTypeID;
  }
  set permisionTypeID(String type) {
             this._permissionTypeID = type;
             notifyListeners();
  }
    int durationCounter = 0;
    durationIncaresment(){
      durationCounter++;
                   notifyListeners();

    }
    durationdicreasent(){
      if(durationCounter!=0){
        durationCounter--;
                     notifyListeners();

      }
    }
 
}

class AssignmentChangeRequest extends ChangeNotifier {
  String _newLocation;
    String  get newLocation   {
         return _newLocation;
  }
  set newLocation(String type) {
             this._newLocation = type;
             notifyListeners();
  }
 

 String _newDepartment;
    String  get newDepartment   {
         return _newDepartment;
  }
  set newDepartment(String type) {
             this._newDepartment = type;
             notifyListeners();
  }
 


 String _newPosition;
    String  get newPostion   {
         return _newPosition;
  }
  set newPostion(String type) {
             this._newPosition = type;
             notifyListeners();
  }
 
}

class VacationBalanceRequest extends ChangeNotifier {
  String _vacationBalanceID;
    String  get vacationBalanceID   {
         return _vacationBalanceID;
  }
  set vacationBalanceID(String type) {
             this._vacationBalanceID = type;
             notifyListeners();
  }
   String _year;
    String  get year   {
         return _year;
  }
  set year(String type) {
             this._year = type;
             notifyListeners();
  }
 
}

class TermnisionRequest extends ChangeNotifier {
  String _terminationType;
    String  get terminationType   {
         return _terminationType;
  }
  set terminationType(String type) {
             this._terminationType = type;
             notifyListeners();
  }
 
}

class LoanRequest extends ChangeNotifier {
  int count=0;
  int value=0;
  increamentCount(){
    count++;
     notifyListeners();
  }
  discreamntcount(){
    if(count!=0){
      count--;
       notifyListeners();
    }
  }
  incraementvalue(){
    value++;
     notifyListeners();
  }
  discraemnetntvalue(){
    if(value!=0){
      value--;
       notifyListeners();
    }
  }
  String _loanType;
    String  get loanType   {
         return _loanType;
  }
  set loanType(String type) {
             this._loanType = type;
             notifyListeners();
  }
   String _startMonth;
    String  get startmonth   {
         return _startMonth;
  }
  set startmonth(String type) {
             this._startMonth = type;
             notifyListeners();
  }
 
  String _endMonth;
    String  get endMonth   {
         return _endMonth;
  }
  set endMonth(String type) {
             this._endMonth = type;
             notifyListeners();
  }
 
  String _startYear;
    String  get startYear   {
         return _startYear;
  }
  set startYear(String type) {
             this._startYear = type;
             notifyListeners();
  }
  String _endYear;
    String  get endYear   {
         return _endYear;
  }
  set endYear(String type) {
             this._endYear = type;
             notifyListeners();
  }
 
 
}

class PayrollAdjustmentRequest extends ChangeNotifier {
  String _payItem;
    String  get payItem   {
         return _payItem;
  }
  set payItem(String type) {
             this._payItem = type;
             notifyListeners();
  }
   String _startMonth;
    String  get startMonth   {
         return _startMonth;
  }
  set startMonth(String type) {
             this._startMonth = type;
             notifyListeners();
  }
   String _endMonth;
    String  get endMonth   {
         return _endMonth;
  }
  set endMonth(String type) {
             this._endMonth = type;
             notifyListeners();
  }
   String _startYear;
    String  get startYear   {
         return _startYear;
  }
  set startYear(String type) {
             this._startYear = type;
             notifyListeners();
  }
   String _endYear;
    String  get endyear   {
         return _endYear;
  }
  set endyear(String type) {
             this._endYear = type;
             notifyListeners();
  }

 
}
