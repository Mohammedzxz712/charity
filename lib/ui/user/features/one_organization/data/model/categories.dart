class Categories {
  Categories({
    this.name,
    this.description,
    this.image,
  });

  Categories.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
  String? name;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    return map;
  }
}
