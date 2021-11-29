import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techcompose/models/comment_response.dart';
import 'package:techcompose/models/post_response.dart';
import 'package:techcompose/models/user_response.dart';
import 'package:techcompose/repositories/UserRepository.dart';

part 'main_event.dart';

enum MainStates {
  SplashIN,
  Home,
  LoggedLOADING,
}

enum AddressType { HOME, OTHER, OFFICE }

class MainBloc extends Bloc<MainEvent, MainStates> {
  UserRepository userRepository = UserRepository.getInstance();

  List<PostResponse> posts;

  // user login flag will be checked
  init() async {
    posts = await userRepository.getPostData();
    this.add(WelcomeIn());
    print("asd = > ${posts.length}");
  }

  MainBloc() : super(MainStates.SplashIN);

  @override
  Stream<MainStates> mapEventToState(MainEvent event) async* {
    // sets state based on events
    if (event is WelcomeIn) {
      yield MainStates.LoggedLOADING;
      yield MainStates.Home;
    } else if (event is SplashIn) {
      yield MainStates.SplashIN;
    }
  }

  static FutureOr<String> getUserInitialsIsolate(int userId) async {
    try {
      UserRepository userRepository = UserRepository();
      var user = await userRepository.getUsersData(userId);
      // if (users.where((element) => element.id == userId).isNotEmpty) {
      //   String name = users.where((element) => element.id == userId).first.name;
      String name = user.name;
      var arrayOfName = name.split(" ");
      String value = arrayOfName.length > 2
          ? arrayOfName[1].trimLeft()[0] + arrayOfName[2].trimLeft()[0]
          : arrayOfName.length > 1
              ? arrayOfName[0].trimLeft()[0] + arrayOfName[1].trimLeft()[0]
              : arrayOfName[0].trimLeft()[0] + arrayOfName[0].trimLeft()[0];

      return "$value";
      // } else {
      //   return "NA";
      // }
    } catch (e) {
      return "NA";
    }
  }

  Future<String> getUserInitials(int userId) async {
    return compute(getUserInitialsIsolate, userId);
  }

  static FutureOr<String> getCommentCountIsolate(int id) async {
    try {
      UserRepository userRepository = UserRepository();
      List<CommentResponse> comments = await userRepository.getCommentsData(id);
      if (comments.where((element) => element.postId == id).isNotEmpty) {
        return comments
            .where((element) => element.postId == id)
            .length
            .toString();
      } else {
        return "0";
      }
    } catch (e) {
      return "0";
    }
  }

  Future<String> getCommentCount(int id) async {
    return compute(getCommentCountIsolate, id);
  }
}
