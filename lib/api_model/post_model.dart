// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String title;
  final String content;
  final String command;
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
