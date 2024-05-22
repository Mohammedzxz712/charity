class GetProfile {
  GetProfile({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.status,
    this.role,
    this.gender,
    this.image,
    this.birthDate,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.createdAt,
    this.location,
    this.updatedAt,
  });

  GetProfile.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    role = json['role'];
    gender = json['gender'];
    image = json['image'];
    birthDate = json['birth_date'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;

  String? location;
  String? phone;
  String? email;
  String? status;
  String? role;
  String? gender;
  dynamic image;
  dynamic birthDate;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  String? createdAt;
  String? updatedAt;
}
