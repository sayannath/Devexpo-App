import 'dart:math';
import 'package:flutter/material.dart';
import 'package:devexpo_app/agenda/cloud_screen.dart';
import 'package:devexpo_app/agenda/mobile_screen.dart';
import 'package:devexpo_app/home/index.dart';
import 'package:devexpo_app/universal/dev_scaffold.dart';
import 'package:devexpo_app/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendaPage extends StatelessWidget {
  static const String routeName = "/agenda";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return DefaultTabController(
      length: 2,
      child: DevScaffold(
        title: "Agenda",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text("14th March"),
              icon: Icon(
                FontAwesomeIcons.peopleCarry,
                size: 12,
              ),
            ),
            Tab(
              child: Text("15th March"),
              icon: Icon(
                FontAwesomeIcons.microphone,
                size: 12,
              ),
            ),
            // Tab(
            //   child: Text("Web & More"),
            //   icon: Icon(
            //     FontAwesomeIcons.chrome,
            //     size: 12,
            //   ),
            // )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CloudScreen(
              homeBloc: _homeBloc,
            ),
            MobileScreen(
              homeBloc: _homeBloc,
            ),
            // WebScreen(
            //   homeBloc: _homeBloc,
            // ),
          ],
        ),
      ),
    );
  }
}
