class GetAllOrganizations {
  GetAllOrganizations({
    this.organizations,
    this.success,
  });

  GetAllOrganizations.fromJson(dynamic json) {
    if (json['organizations'] != null) {
      organizations = [];
      json['organizations'].forEach((v) {
        organizations?.add(Organizations.fromJson(v));
      });
    }
    success = json['success'];
  }
  List<Organizations>? organizations;
  bool? success;
}

class Organizations {
  Organizations({
    this.id,
    this.name,
    this.description,
    this.phoneNumber,
    this.email,
    this.image,
  });

  Organizations.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    description = json['description'];
    image = json['image'];
  }
  int? id;
  String? name;

  String? description;
  String? phoneNumber;
  String? email;
  String? image;
}
