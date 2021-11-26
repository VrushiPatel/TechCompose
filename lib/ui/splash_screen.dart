import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techcompose/bloc/main_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MainBloc bloc;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      bloc.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Loading..."),
            Container(
                margin: EdgeInsets.all(10), child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
