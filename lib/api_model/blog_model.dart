import 'dart:convert';

import 'package:ui_teach_news/constant/api_const.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class BlogModel {
  String? id;
  String? title;
  String? image;
  int? view;
  String? status;
  String? createdAt;

  BlogModel(
    this.id,
    this.title,
    this.image,
    this.view,
    this.status,
    this.createdAt,
  );

  BlogModel copyWith({
    String? id,
    String? title,
    String? image,
    int? view,
    String? status,
    String? createdAt,
  }) {
    return BlogModel(
      id ?? this.id,
      title ?? this.title,
      image ?? this.image,
      view ?? this.view,
      status ?? this.status,
      createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'view': view,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      map['id'] != null ? map['id'].toString() : null,
      map['title'] != null ? map['title'].toString() : null,
      ApiConst.baseUrl + (map['image'] ?? ''),
      map['view'] != null ? int.parse(map['view'].toString()) : null,
      map['status'] != null ? map['status'].toString() : null,
      map['created_at'] != null ? map['created_at'].toString() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BlogModel(id: $id, title: $title, image: $image, view: $view, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.view == view &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        view.hashCode ^
        status.hashCode ^
        createdAt.hashCode;
  }
}
