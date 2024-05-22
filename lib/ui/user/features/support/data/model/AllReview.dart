class AllReview {
  AllReview({
    this.reviews,
    this.success,
  });

  AllReview.fromJson(dynamic json) {
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    success = json['success'];
  }
  List<Reviews>? reviews;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    return map;
  }
}

class Reviews {
  Reviews({
    this.text,
    this.userName,
  });

  Reviews.fromJson(dynamic json) {
    text = json['text'];
    userName = json['user_name'];
  }
  String? text;
  String? userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['user_name'] = userName;
    return map;
  }
}
