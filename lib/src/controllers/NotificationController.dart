import 'dart:async';
import 'dart:convert';
import 'package:b_smart/src/data/models/NotificationModel.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/services/UserServicess.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class NotificationController extends ControllerMVC {
  //to make single instance of class
  factory NotificationController() {
    if (_this == null) _this = NotificationController._();
    return _this;
  }
  static NotificationController _this;

  NotificationController._();

  static NotificationController get con => _this;

  UserService userService = UserService();
  List<NotificationModel> notificationList = List<NotificationModel>();
  Future<List<NotificationModel>> getNotificationList() async {
    String url = "${ConstantVarable.baseUrl}/api/inbox/my-notifications";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new NotificationModel.fromJson(f))
            .toList();
      } else
        return List<NotificationModel>();
    }, onError: (err) {});
  }

  Future<bool> getAllNotifications() async {
    refresh();

    notificationList = await getNotificationList();

    refresh();

    if (notificationList.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> readNotification(int notificationId) async {
    String url =
        "${ConstantVarable.baseUrl}/api/notifications/$notificationId/read";

    return await http.post(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }, onError: (err) {});
  }
}
