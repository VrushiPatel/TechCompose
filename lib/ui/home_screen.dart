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
    return Scaffold(
      appBar: AppBar(
        title: getSubTitle("Post Page", color: Colors.white, fontSize: 16),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: bloc.posts
            .map<ListTile>((post) {
          if (post.creatorName == null) {
            bloc.getUserInitials(post.userId).then((value) {
              setState(() {
                post.creatorName = value;
              });
            });
          }
          if (post.commentNo == null) {
            bloc.getCommentCount(post.id).then((value) {
              setState(() {
                post.commentNo = value;
              });
            });
          }
          return ListTile(
            dense: true,
            title: getSubTitle(post.body, fontSize: 12, lines: 3),
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 30,
              height: 30,
              child: Center(
                child: getSubTitle(post.creatorName ?? "NA",
                    bold: true, color: Colors.white),
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 20,
              height: 20,
              child: Center(
                child: getSubTitle(post.commentNo ?? "0",
                    bold: true, fontSize: 12, color: Colors.white),
              ),
            ),
          );
        })
            .toList(),
      ),
    );
  }
}
