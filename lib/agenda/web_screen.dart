import 'package:flutter/material.dart';
import 'package:devexpo_app/agenda/session_list.dart';
import 'package:devexpo_app/home/index.dart';

class WebScreen extends StatelessWidget {
  final HomeBloc homeBloc;

  const WebScreen({Key key, this.homeBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var state = homeBloc.currentState as InHomeState;
    var sessions = state.sessionsData.sessions;
    var webSessions = sessions.where((s) => s.track == "web").toList();
    return SessionList(
      allSessions: webSessions,
    );
  }
}
