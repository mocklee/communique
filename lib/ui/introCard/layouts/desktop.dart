import 'package:flutter/material.dart';
import 'package:communique/ui/introCard/heroText.dart';
import 'package:communique/ui/introCard/introInput.dart';

class DesktopIntro extends StatelessWidget {
  const DesktopIntro({Key key}) : super(key: key);

  final String introTitle = 'Let the collective voice rise.';

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 350,
            height: 450,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  title: Text(introTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                    bottom: 36,
                    right: 25,
                    left: 25,
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 275,
                    child: new HeroText(),
                  )),
              SizedBox(
                width: 275,
                child: IntroInput(),
              )
            ])));
  }
}
