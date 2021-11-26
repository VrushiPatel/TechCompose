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
  List<CommentResponse> comments;
  List<UserResponse> users;

  // user login flag will be checked
  init() async {
    posts = await userRepository.getPostData();
    comments = await userRepository.getCommentsData();
    users = await userRepository.getUsersData();
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

  String getUserInitials(int userId) {
    try {
      if (users.where((element) => element.id == userId).isNotEmpty) {
        String name = users.where((element) => element.id == userId).first.name;
        return name.substring(0, 1) +
            name.substring(name.indexOf(" ")+1, name.indexOf(" ") + 2);
      } else {
        return "NA";
      }
    } catch (e) {
      return "NA";
    }
  }

  String getCommentCount(int id) {
    try {
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
}
