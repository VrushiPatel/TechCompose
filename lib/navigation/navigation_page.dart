import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techcompose/bloc/main_bloc.dart';
import 'package:techcompose/ui/home_screen.dart';
import 'package:techcompose/ui/splash_screen.dart';

Future<String> onSelect(String data) async {
  print("onSelectNotification $data");
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  MainBloc bloc;

  @override
  Widget build(BuildContext context) {
    // initial state is set here
    // ignore: close_sinks
    bloc = BlocProvider.of<MainBloc>(context);
    bloc.add(SplashIn());
    // Platform.isAndroid ? bloc.add(SplashIn()) : bloc.init();
    return WillPopScope(
      child: Scaffold(
        body: BlocBuilder<MainBloc, MainStates>(
          builder: (context, state) {
            if (state == MainStates.SplashIN) {
              return SplashScreen();
            } else if (state == MainStates.Home) {
              return HomeScreen();
            } else if (state == MainStates.LoggedLOADING) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Loading..."),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
