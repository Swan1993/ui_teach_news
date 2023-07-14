// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:ui_teach_news/constant/api_const.dart';

class PosterModel {
  String? id;
  String? title;
  String image;

  PosterModel({
    this.id,
    this.title,
    required this.image,
  });

  PosterModel copyWith({
    String? id,
    String? title,
    String? image,
  }) {
    return PosterModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
    };
  }

  factory PosterModel.fromMap(Map<String, dynamic> map) {
    return PosterModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      image: ApiConst.baseUrl + map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PosterModel.fromJson(String source) =>
      PosterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PosterModel(id: $id, title: $title, image: $image)';

  @override
  bool operator ==(covariant PosterModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ image.hashCode;
}
