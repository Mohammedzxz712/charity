class LoginModel {
  LoginModel({
    this.token,
    this.name,
    this.id,
    this.success,
  });

  LoginModel.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    id = json['id'];
    success = json['success'];
  }
  String? token;

  int? id;
  String? name;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    map['id'] = id;
    map['success'] = success;
    return map;
  }
}
