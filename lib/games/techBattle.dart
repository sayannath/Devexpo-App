
import 'package:devexpo_app/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TechBattle extends StatefulWidget {
  @override
  _TechBattleState createState() => _TechBattleState();
}

class _TechBattleState extends State<TechBattle> {
  Widget _buildListItems(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(children: [
        Expanded(
          child: Text(document['name'],
              style: Theme.of(context).textTheme.headline),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            document['votes'].toString(),
            style: Theme.of(context).textTheme.display1,
          ),
        )
      ]),
      onTap: (){
        Firestore.instance.runTransaction((transaction) async{
          DocumentSnapshot freshSnap = await transaction.get(document.reference);
          await transaction.update(freshSnap.reference, {
            'votes': freshSnap['votes'] + 1,
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        title: 'Tech Battle',
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('techBattle').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) 
            return Center(child: const Text('Loading...'));
            return Center(
              child: ListView.builder(
                  itemExtent: 80.0,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _buildListItems(context, snapshot.data.documents[index])),
            );
          },
        ));
  }
}
