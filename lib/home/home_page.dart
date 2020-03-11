import 'package:flutter/material.dart';
import 'package:devexpo_app/home/index.dart';
import 'package:devexpo_app/universal/dev_scaffold.dart';


class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return DevScaffold(
      body: HomeScreen(homeBloc: _homeBloc),
      title: "Home",
    );
  }
}
