class LoginModel2 {
  LoginModel2({
    this.token,
    this.name,
    this.success,
  });

  LoginModel2.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    success = json['success'];
  }
  String? token;
  String? name;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    map['success'] = success;
    return map;
  }
}
