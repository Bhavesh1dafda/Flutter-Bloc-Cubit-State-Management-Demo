// To parse this JSON data, do
//
//     final userPost = userPostFromJson(jsonString);

import 'dart:convert';

List<UserPost> userPostFromJson(String str) => List<UserPost>.from(json.decode(str).map((x) => UserPost.fromJson(x)));

String userPostToJson(List<UserPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPost {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
