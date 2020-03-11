import 'package:flutter/material.dart';
import 'package:devexpo_app/agenda/agenda_page.dart';
import 'package:devexpo_app/config/index.dart';
import 'package:devexpo_app/faq/faq_page.dart';
import 'package:devexpo_app/map/map_page.dart';
import 'package:devexpo_app/speakers/speaker_page.dart';
import 'package:devexpo_app/sponsors/sponsor_page.dart';
import 'package:devexpo_app/team/team_page.dart';
import 'package:devexpo_app/universal/image_card.dart';
import 'package:devexpo_app/utils/devfest.dart';
import 'package:devexpo_app/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeFront extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  signOut() async {
    _auth.signOut();
  }

  List<Widget> devFestTexts(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Devfest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget actions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.0,
        children: <Widget>[
          RaisedButton(
            child: Text("Agenda"),
            shape: StadiumBorder(),
            color: Colors.red,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          RaisedButton(
            child: Text("Speakers"),
            shape: StadiumBorder(),
            color: Colors.green,
            colorBrightness: Brightness.dark,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          RaisedButton(
            child: Text("Sponsors"),
            shape: StadiumBorder(),
            color: Colors.orange,
            colorBrightness: Brightness.dark,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          RaisedButton(
            child: Text("Team"),
            shape: StadiumBorder(),
            color: Colors.purple,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          RaisedButton(
            child: Text("Register"),
            shape: StadiumBorder(),
            color: Colors.blueGrey,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          RaisedButton(
            child: Text("Locate Us"),
            shape: StadiumBorder(),
            color: Colors.blue,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          ),
        ],
      );

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
            icon: Icons.schedule,
            color: Colors.red,
            title: Devfest.agenda_text,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          ActionCard(
            icon: Icons.person,
            color: Colors.green,
            title: Devfest.speakers_text,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.amber,
            title: 'Developers',
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: Colors.purple,
            title: Devfest.sponsor_text,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ActionCard(
            icon: Icons.edit,
            color: Colors.brown,
            title: 'Register',
            onPressed: () async {
                await _launchURL("https://docs.google.com/forms/d/e/1FAIpQLSc1HlEACdihO85vJSwVcHYt3JQEjl2tT3MMDfrs4i-OtRtwqg/viewform");
              },
          ),
          ActionCard(
            icon: Icons.map,
            color: Colors.blue,
            title: Devfest.map_text,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          )
        ],
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://facebook.com/dsckiit");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/dsckiit");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL("https://linkedin.com/company/dsckiit");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL("https://youtube.com/dsckiit");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () async {
                await _launchURL("https://instagram.com/dsckiit");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:dsckiit@gmail.com?subject=Support Needed For DevExpo App&body={Name: Sayan Nath},Email: dsckiit@gmail.com}''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn
                  ? Devfest.banner_dark
                  : Devfest.banner_light,
            ),
            SizedBox(
              height: 20,
            ),
            ...devFestTexts(context),
            SizedBox(
              height: 20,
            ),
            newActions(context),
            SizedBox(
              height: 20,
            ),
            socialActions(context),
            SizedBox(
              height: 20,
            ),
            Text(
              '#DevExpo2020',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Devfest.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
