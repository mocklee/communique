import 'package:communique/landing/hero/heroText.dart';
import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  IntroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 300,
            height: 400,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                title: Text('Let the collective voice rise.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Text('Find the words to support your cause',
                    style: TextStyle(fontSize: 11)),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(width: 300, child: new HeroText()))
            ])));
  }
}
