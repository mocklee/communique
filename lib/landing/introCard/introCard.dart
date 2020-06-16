import 'package:communique/landing/introCard/heroText.dart';
import 'package:communique/landing/introCard/infoInput.dart';
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
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  title: Text('Let the collective voice rise.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                  subtitle: Text('Find the words to support your cause',
                      style: TextStyle(
                        fontSize: 11,
                      ))),
              Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                    right: 20,
                    left: 20,
                  ),
                  child: Container(
                    width: 300,
                    child: new HeroText(),
                  )),
              SizedBox(
                  width: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InfoInput(),
                    ],
                  ))
            ])));
  }
}
