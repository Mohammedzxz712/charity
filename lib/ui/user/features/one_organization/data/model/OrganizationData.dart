class OrganizationData {
  OrganizationData({
      this.organization,
      this.success,});

  OrganizationData.fromJson(dynamic json) {
    organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
    success = json['success'];
  }
  Organization? organization;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (organization != null) {
      map['organization'] = organization?.toJson();
    }
    map['success'] = success;
    return map;
  }

}

class Organization {
  Organization({
      this.id,
      this.name,
      this.description,
      this.phoneNumber,
      this.address,
      this.email,
      this.image,
      this.isActive,
      this.hasDelegate,});

  Organization.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    email = json['email'];
    image = json['image'];
    isActive = json['is_active'];
    hasDelegate = json['has_delegate'];
  }
  int? id;
  String? name;
  String? description;
  String? phoneNumber;
  String? address;
  String? email;
  String? image;
  String? isActive;
  String? hasDelegate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['phone_number'] = phoneNumber;
    map['address'] = address;
    map['email'] = email;
    map['image'] = image;
    map['is_active'] = isActive;
    map['has_delegate'] = hasDelegate;
    return map;
  }

}