// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:ui_teach_news/constant/api_const.dart';

class Product {
  final Poster poster;
  final List<TopVisited> topVisited;

  Product({
    required this.poster,
    required this.topVisited,
  });

  get content => null;

  Product copyWith({
    Poster? poster,
    List<TopVisited>? topVisited,
  }) =>
      Product(
        poster: poster ?? this.poster,
        topVisited: topVisited ?? this.topVisited,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        poster: Poster.fromJson(json["poster"]),
        topVisited: List<TopVisited>.from(
            json["top_visited"].map((x) => TopVisited.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "poster": poster.toJson(),
        "top_visited": List<dynamic>.from(topVisited.map((x) => x.toJson())),
      };
}

class Poster {
  final String id;
  final String title;
  final String image;

  Poster({
    required this.id,
    required this.title,
    required this.image,
  });

  Poster copyWith({
    String? id,
    String? title,
    String? image,
  }) =>
      Poster(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
      );

  factory Poster.fromRawJson(String str) => Poster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}

class TopVisited {
  final String id;
  final String title;
  final String image;
  final String view;
  final String status;
  final String? content;
  final String createdAt;

  TopVisited({
    required this.id,
    required this.title,
    required this.image,
    required this.view,
    required this.status,
    required this.content,
    required this.createdAt,
  });

  TopVisited copyWith({
    String? id,
    String? title,
    String? image,
    String? view,
    String? status,
    String? content,
    String? createdAt,
  }) =>
      TopVisited(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        view: view ?? this.view,
        status: status ?? this.status,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );

  factory TopVisited.fromRawJson(String str) =>
      TopVisited.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopVisited.fromJson(Map<String, dynamic> json) => TopVisited(
        id: json["id"],
        title: json["title"],
        image: ApiConst.baseUrl + json["image"],
        view: json["view"],
        status: json["status"],
        content: json["content"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "view": view,
        "status": status,
        "content": content,
        "created_at": createdAt,
      };
}
