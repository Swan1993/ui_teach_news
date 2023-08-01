// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
/*
class PostModel {
  final String? title;
  final String content;
  final String? command;
  final String image;

  PostModel({
    required this.title,
    required this.content,
    required this.command,
    required this.image,
  });

  PostModel copyWith({
    String? title,
    String? content,
    String? command,
    String? image,
  }) {
    return PostModel(
      title: title ?? this.title,
      content: content ?? this.content,
      command: command ?? this.command,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'command': command,
      'image': image,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] as String,
      content: map['content'] as String,
      command: map['command'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(title: $title, content: $content, command: $command, image: $image)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.content == content &&
        other.command == command &&
        other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        content.hashCode ^
        command.hashCode ^
        image.hashCode;
  }
}

*/

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

class Post {
  final bool success;
  final int statusCode;
  final String msg;
  final Data data;

  Post({
    required this.success,
    required this.statusCode,
    required this.msg,
    required this.data,
  });

  Post copyWith({
    bool? success,
    int? statusCode,
    String? msg,
    Data? data,
  }) =>
      Post(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        success: json["success"],
        statusCode: json["status_code"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  final String? title;
  final String content;
  final String? command;
  final String image;
  Data({
    this.title,
    required this.content,
    this.command,
    required this.image,
  });

  Data copyWith({
    String? title,
    String? content,
    String? command,
    String? image,
  }) {
    return Data(
      title: title ?? this.title,
      content: content ?? this.content,
      command: command ?? this.command,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'command': command,
      'image': image,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] as String,
      command: map['command'] != null ? map['command'] as String : null,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(title: $title, content: $content, command: $command, image: $image)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.content == content &&
        other.command == command &&
        other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        content.hashCode ^
        command.hashCode ^
        image.hashCode;
  }
}
