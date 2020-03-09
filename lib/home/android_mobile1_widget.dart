import 'package:devexpo_app/home/home_widgets/home_front.dart';
import 'package:flutter/material.dart';
import 'package:devexpo_app/home/values/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:devexpo_app/home/index.dart';
import '../home/values/colors.dart';
import '../home/values/values.dart';


final kFirebaseAnalytics = FirebaseAnalytics();

class AndroidMobile1Widget extends StatefulWidget {
  @override
  _AndroidMobile1WidgetState createState() => _AndroidMobile1WidgetState();
}

class _AndroidMobile1WidgetState extends State<AndroidMobile1Widget> {

  static const String routeName = "/androidmobilewidget";
  var _homeBloc = HomeBloc();

  FirebaseUser _user;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then(
          (user) => setState(() => this._user = user),
        );
  }

  // Sign in with Google.
  Future<FirebaseUser> _googleSignIn() async {
    final curUser = this._user ?? await FirebaseAuth.instance.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Note: user.providerData[0].photoUrl == googleUser.photoUrl.
    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    kFirebaseAnalytics.logLogin();
    setState(() => this._user = user);
    return user;
  }

  Future<Null> _signOut() async {
    final user = await FirebaseAuth.instance.currentUser();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(user == null
            ? 'No user logged in.'
            : '"${user.displayName}" logged out.'),
      ),
    );
    FirebaseAuth.instance.signOut();
    setState(() => this._user = null);
  }

  void _showUserProfilePage(FirebaseUser user) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return HomeFront();
    }));
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.blue,
      onPressed: this._busy
          ? null
          : () async {
              setState(() => this._busy = true);
              final user = await this._googleSignIn();
              this._showUserProfilePage(user);
              setState(() => this._busy = false);
            },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/image8-2.png"), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 191,
                height: 164,
                child: Image.asset(
                  "assets/images/path-1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 173,
                height: 28,
                margin: EdgeInsets.only(top: 65),
                child: Image.asset(
                  "assets/images/group-47.png",
                  fit: BoxFit.none,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Center(
              child: _signInButton(),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Join the ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      Text('Community',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 319,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/group-1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 73,
                    bottom: 19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 24,
                          margin: EdgeInsets.only(right: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 13,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 25,
                                        height: 13,
                                        child: Image.asset(
                                          "assets/images/group-8.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 140,
                                        height: 13,
                                        child: Image.asset(
                                          "assets/images/group-39.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 125,
                                  height: 8,
                                  margin: EdgeInsets.only(right: 15),
                                  child: Image.asset(
                                    "assets/images/group-38.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 12,
                            height: 13,
                            margin: EdgeInsets.only(top: 11),
                            child: Image.asset(
                              "assets/images/path-2.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 18,
                          margin: EdgeInsets.only(left: 2),
                          child: Image.asset(
                            "assets/images/group-40.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

