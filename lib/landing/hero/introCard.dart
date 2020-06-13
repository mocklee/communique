import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  IntroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 300,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text('Let the collective voice rise.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Text('Find the words to support your cause',
                    style: TextStyle(fontSize: 11)),
              )
            ])));
  }
}
