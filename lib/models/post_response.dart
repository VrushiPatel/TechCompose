// To parse this JSON data, do
//
//     final postResponse = postResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<PostResponse> postResponseFromJson(String str) => List<PostResponse>.from(json.decode(str).map((x) => PostResponse.fromJson(x)));

String postResponseToJson(List<PostResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResponse {
  PostResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.commentNo,
    this.creatorName,
  });

  int userId;
  int id;
  String title;
  String body;
  String commentNo;
  String creatorName;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
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
