class UserModelFire {
  String? name;
  String? email;
  String? uId;
  String? phone;
  bool? isEmailVerified;

  UserModelFire({
    this.name,
    this.email,
    this.uId,
    this.phone,
    this.isEmailVerified,
  });

  UserModelFire.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];

    isEmailVerified = json['isEmailVerified'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
