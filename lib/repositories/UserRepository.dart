import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:techcompose/models/comment_response.dart';
import 'package:techcompose/models/post_response.dart';
import 'package:techcompose/models/user_response.dart';

// will be user for user related api calling and data processing
class UserRepository {
  String baseUrl = "https://jsonplaceholder.typicode.com";

  UserRepository();

  static UserRepository getInstance() {
    return UserRepository();
  }

  Future<List<PostResponse>> getPostData() async {
    return http.Client()
        .get(
          "$baseUrl/posts",
        )
        .timeout(const Duration(seconds: 60))
        .then((value) {
      // try {
        if (value.statusCode == 200) {
          return postResponseFromJson(value.body);
        } else {
          return [];
        }
      // } catch (e) {
      //   return [];
      // }
    });
  }

  Future<List<CommentResponse>> getCommentsData() async {
    return http.Client()
        .get(
          "$baseUrl/comments",
        )
        .timeout(const Duration(seconds: 60))
        .then((value) {
      try {
        if (value.statusCode == 200) {
          return commentResponseFromJson(value.body);
        } else {
          return [];
        }
      } catch (e) {
        return [];
      }
    });
  }

  Future<List<UserResponse>> getUsersData() async {
    return http.Client()
        .get(
          "$baseUrl/users",
        )
        .timeout(const Duration(seconds: 60))
        .then((value) {
      try {
        if (value.statusCode == 200) {
          return userResponseFromJson(value.body);
        } else {
          return [];
        }
      } catch (e) {
        return [];
      }
    });
  }
}
