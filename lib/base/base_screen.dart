import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techcompose/bloc/main_bloc.dart';

abstract class BaseStatefulWidget extends StatefulWidget
    with WidgetsBindingObserver {}

abstract class BaseState<Screen extends BaseStatefulWidget>
    extends State<Screen> with RouteAware /*, WidgetsBindingObserver*/ {}

mixin BasicScreen<Screen extends BaseStatefulWidget> on BaseState<Screen> {
  MainBloc bloc;
  BuildContext baseContext;

  @override
  Widget build(BuildContext context) {
    baseContext = context;
    bloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: buildBody(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildBody(BuildContext context);
}
