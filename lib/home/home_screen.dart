import 'dart:math';

import 'package:devexpo_app/home/android_mobile1_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devexpo_app/dialogs/error_dialog.dart';
import 'package:devexpo_app/home/home_widgets/home_front.dart';
import 'package:devexpo_app/home/index.dart';
import 'package:devexpo_app/utils/tools.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  bool isSignedIn = false;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context){
          return AndroidMobile1Widget();
        }));
      }
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;

        this.isSignedIn = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
    this._homeBloc.dispatch(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget._homeBloc,
      listener: (context, state) {
        if (state is ErrorHomeState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorDialog(
              error: state.errorMessage,
              onTap: () {
                _homeBloc.dispatch(LoadHomeEvent());
              },
            ),
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
          bloc: widget._homeBloc,
          builder: (
            BuildContext context,
            HomeState currentState,
          ) {
            if (currentState is UnHomeState) {
              return Center(
                child: SpinKitChasingDots(
                  color: Tools.multiColors[Random().nextInt(3)],
                ),
              );
            }
            if (currentState is ErrorHomeState) {
              return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      currentState.errorMessage ?? 'Error',
                      textAlign: TextAlign.center,
                    ),
                  ));
            }
            return HomeFront();
          }),
    );
  }
}
