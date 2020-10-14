


class PermissionIdModel {
      String name;
      String id;
      PermissionIdModel({this.name,this.id});
      factory PermissionIdModel.fromjson(Map <String,dynamic> jsondata)=>
      PermissionIdModel(
        name: jsondata["name"],
        id: jsondata["id"]
      );
}