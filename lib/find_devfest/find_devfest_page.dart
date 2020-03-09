import 'package:flutter/material.dart';
import 'package:devexpo_app/universal/dev_scaffold.dart';

class FindDevFestPage extends StatelessWidget {
  static const String routeName = "/find";

  @override
  Widget build(BuildContext context) {
    // var _homeBloc = HomeBloc();
    return DevScaffold(
      body: Container(
        child: Center(
          child: Text("Coming Soon"),
        ),
      ),
      title: "Find A DevFest",
    );
  }
}
