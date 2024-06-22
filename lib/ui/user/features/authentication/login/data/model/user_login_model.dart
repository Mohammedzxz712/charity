class LoginModel {
  LoginModel({
    this.token,
    this.name,
    this.success,
  });

  LoginModel.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];

    success = json['success'];
  }
  String? token;

  String? name;
  bool? success;
}
