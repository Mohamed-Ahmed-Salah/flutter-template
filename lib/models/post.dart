// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  String title;
  String body;
  int id;
  int userId;

  Post({
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });

  Post copyWith({
    String? title,
    String? body,
    int? id,
    int? userId,
  }) {
    return Post(
      title: title ?? this.title,
      body: body ?? this.body,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'id': id,
      'userId': userId,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      body: map['body'] as String,
      id: map['id'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(title: $title, body: $body, id: $id, userId: $userId)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.id == id &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ id.hashCode ^ userId.hashCode;
  }
}
