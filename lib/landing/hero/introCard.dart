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
                  child: Container(
                      width: 300,
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Step 1:\n',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 0.5)),
                                TextSpan(
                                    text:
                                        'Let the recepient know who you are! Fill in your details below.',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 0.4))
                              ]))))
            ])));
  }
}
