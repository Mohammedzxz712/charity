class Camp {
  Camp({
    this.allCampaign,
    this.success,
  });

  Camp.fromJson(dynamic json) {
    if (json['allCampaign'] != null) {
      allCampaign = [];
      json['allCampaign'].forEach((v) {
        allCampaign?.add(AllCampaign.fromJson(v));
      });
    }
    success = json['success'];
  }
  List<AllCampaign>? allCampaign;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (allCampaign != null) {
      map['allCampaign'] = allCampaign?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    return map;
  }
}

class AllCampaign {
  AllCampaign({
    this.id,
    this.title,
    this.description,
    this.image,
    this.targetAmount,
    this.endDate,
  });

  AllCampaign.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    targetAmount = json['target_amount'];
    endDate = json['end_date'];
  }
  int? id;
  String? title;
  String? description;
  String? image;
  String? targetAmount;
  String? endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['target_amount'] = targetAmount;
    map['end_date'] = endDate;
    return map;
  }
}
