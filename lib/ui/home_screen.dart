import 'package:flutter/material.dart';
import 'package:techcompose/base/base_screen.dart';
import 'package:techcompose/utils/common_widgets.dart';

class HomeScreen extends BaseStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    print(bloc.posts.length);
    return ListView(
      children: bloc.posts
          .map<ListTile>((post) =>
          ListTile(
              title: getTitle(post.body, fontSize: 12),
              leading: Container(
                child: getTitle(bloc.getUserInitials(post.userId)),
              ),
              trailing: Container(
                width: 20,
                height: 20,
                child: Center(
                  child: getTitle(bloc.getCommentCount(post.id)),
                ),
              ),
          ))
          .toList(),
    );
  }
}
