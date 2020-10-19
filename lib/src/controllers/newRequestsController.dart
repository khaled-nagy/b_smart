import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/DepartmentModel.dart';
import 'package:b_smart/src/data/models/LoanModel.dart';
import 'package:b_smart/src/data/models/LocationModel.dart';
import 'package:b_smart/src/data/models/LookupsModel.dart';
import 'package:b_smart/src/data/models/PermissionIdModel.dart';
import 'package:b_smart/src/data/models/PositionModel.dart';
import 'package:b_smart/src/data/models/TerminasionModel.dart';
import 'package:b_smart/src/data/models/VacationModel.dart';
import 'package:b_smart/src/widgets/RequestForm.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class NewRequestsController extends ControllerMVC {
  factory NewRequestsController() {
    if (_this == null) _this = NewRequestsController._();
    return _this;
  }
  static NewRequestsController _this;

  NewRequestsController._();

  static NewRequestsController get con => _this;

  Future<List<VacationModel>> getAllVacationList(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("vacation is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new VacationModel.fromJson(f))
            .toList();
      } else
        return List<VacationModel>();
    }, onError: (err) {
      print("vacation error is :::: $err");
    });
  }

  Future<List<PermissionModel>> getAllPermissionList(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("permission is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new PermissionModel.fromJson(f))
            .toList();
      } else
        return List<PermissionModel>();
    }, onError: (err) {
      print("permission error is :::: $err");
    });
  }

  Future<List<TerminasionModel>> getAllTerminasionList(
      String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("termination is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new TerminasionModel.fromJson(f))
            .toList();
      } else
        return List<TerminasionModel>();
    }, onError: (err) {
      print("termination error is :::: $err");
    });
  }

  Future<List<LoanModel>> getAllLoanList(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("loan is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new LoanModel.fromJson(f))
            .toList();
      } else
        return List<LoanModel>();
    }, onError: (err) {
      print("loan error is :::: $err");
    });
  }

  Future<List<LocationModel>> getAllLocations(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("loan is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new LocationModel.fromJson(f))
            .toList();
      } else
        return List<LocationModel>();
    }, onError: (err) {
      print("loan error is :::: $err");
    });
  }

  Future<List<DepartmentModel>> getAlldepartments(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("loan is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new DepartmentModel.fromJson(f))
            .toList();
      } else
        return List<DepartmentModel>();
    }, onError: (err) {
      print("loan error is :::: $err");
    });
  }

  Future<List<PositionModel>> getAllPositions(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";
    print(url);
    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print("loan is :::: $jsonValue");
        return (jsonValue as List)
            .map((f) => new PositionModel.fromJson(f))
            .toList();
      } else
        return List<PositionModel>();
    }, onError: (err) {
      print("loan error is :::: $err");
    });
  }

  List<VacationModel> vacationList = List<VacationModel>();
  List<PermissionModel> permissionList = List<PermissionModel>();
  List<TerminasionModel> terminationList = List<TerminasionModel>();
  List<LoanModel> loanList = List<LoanModel>();
  List<LocationModel> locationList = List<LocationModel>();
  List<DepartmentModel> departmentList = List<DepartmentModel>();
  List<PositionModel> positionList = List<PositionModel>();

  Future getAllLookups(String lookupName) async {
    print("one");
    refresh();
    switch (lookupName) {
      case "vacation-types":
        vacationList = await getAllVacationList(lookupName);

        break;
      case "permission-types":
        permissionList = await getAllPermissionList(lookupName);

        break;
      case "termination-types":
        terminationList = await getAllTerminasionList(lookupName);

        break;
      case "loan-types":
        loanList = await getAllLoanList(lookupName);

        break;
      case "locations":
        locationList = await getAllLocations(lookupName);

        break;
      case "departments":
        departmentList = await getAlldepartments(lookupName);

        break;
      case "positions":
        positionList = await getAllPositions(lookupName);

        break;
    }

    print("tow");

    refresh();
    // print("lookups is : $lookupsList");
  }
}
