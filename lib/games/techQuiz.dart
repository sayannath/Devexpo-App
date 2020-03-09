import 'package:devexpo_app/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TechQuiz extends StatefulWidget {
  @override
  _TechQuizState createState() => _TechQuizState();
}

class _TechQuizState extends State<TechQuiz> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isSignedIn = false;

  final DBRef = FirebaseDatabase.instance.reference();

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
      title: 'Tech Quiz',
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 250,
              ),
              OutlineButton(
                onPressed: () {
                  writeData();
                },
                splashColor: Colors.blue,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.green),
                child: Text(
                  'Buzz',
                  style: Theme.of(context).textTheme.headline,
                ),
                //child: Text('${user.displayName}'),
              ),
              SizedBox(
                height: 100,
              ),
              OutlineButton(
                onPressed: () {
                  deleteData();
                },
                splashColor: Colors.blue,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.red),
                child: Text(
                  'Reset',
                  style: Theme.of(context).textTheme.headline,
                ),
                //child: Text('${user.displayName}'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void writeData() {
    DBRef.child("1").set({
      'time': '${DateTime.now()}',
      'name': '${user.displayName}'
    });
  }

  void deleteData(){
    DBRef.child("1").remove();
  }
}
