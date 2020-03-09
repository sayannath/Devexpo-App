import 'package:flutter/material.dart';
import 'package:devexpo_app/agenda/session_list.dart';
import 'package:devexpo_app/home/index.dart';

class CloudScreen extends StatelessWidget {
  final HomeBloc homeBloc;

  const CloudScreen({Key key, this.homeBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var state = homeBloc.currentState as InHomeState;
    var sessions = state.sessionsData.sessions;
    var cloudSessions = sessions.where((s) => s.track == "cloud").toList();
    return SessionList(
      allSessions: cloudSessions,
    );
  }
}
