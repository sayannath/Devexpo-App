import 'package:devexpo_app/games/techBattle.dart';
import 'package:devexpo_app/games/techQuiz.dart';
import 'package:devexpo_app/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isSignedIn = false;

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

  @override
  void initState() {
    super.initState();
    this.getUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: 'Fun Activities',
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Row(children: <Widget>[
            SizedBox(
              width:90,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                  return TechQuiz();
                }));
              },
              splashColor: Colors.blue,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              highlightElevation: 0,
              borderSide: BorderSide(color: Colors.blue),
              child: Text('Tech Quiz', style: TextStyle(color: Colors.red)),
            ),
            SizedBox(
              width:30,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                  return TechBattle();
                }));
              },
              splashColor: Colors.blue,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              highlightElevation: 0,
              borderSide: BorderSide(color: Colors.blue),
              child: Text('Tech Battle', style: TextStyle(color: Colors.green)),
            ),
          ]),
        ),
      ),
    );
  }
}
