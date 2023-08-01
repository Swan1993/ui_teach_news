import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class BlogModel {
  String? id;
  String? title;
  String? image;
  int? view;
  String? status;
  String? content;
  String? createdAt;

  BlogModel(
    this.id,
    this.title,
    this.image,
    this.view,
    this.status,
    this.content,
    this.createdAt,
  );

  BlogModel copyWith({
    String? id,
    String? title,
    String? image,
    int? view,
    String? status,
    String? content,
    String? createdAt,
  }) {
    return BlogModel(
      id ?? this.id,
      title ?? this.title,
      image ?? this.image,
      view ?? this.view,
      status ?? this.status,
      content ?? this.content,
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
      'content': content,
      'createdAt': createdAt,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      map['id'] != null ? map['id'] as String : null,
      map['title'] != null ? map['title'] as String : null,
      map['image'] != null ? map['image'] as String : null,
      map['view'] != null ? map['view'] as int : null,
      map['status'] != null ? map['status'] as String : null,
      map['content'] != null ? map['content'] as String : null,
      map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BlogModel(id: $id, title: $title, image: $image, view: $view, status: $status, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.view == view &&
        other.status == status &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        view.hashCode ^
        status.hashCode ^
        content.hashCode ^
        createdAt.hashCode;
  }
}
