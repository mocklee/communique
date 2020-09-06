library landing;

import 'package:communique/landing/addIconPainter.dart';
import 'package:flutter/material.dart';

import './introCard/introCard.dart';
import './repCard/repCard.dart';

class Landing extends StatefulWidget {
  Landing({Key key, this.title, this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: AppBar(
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text(widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Visibility(
                      visible: true,
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                            fontSize: 13.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white.withOpacity(0.7)),
                      ))
                ]))),
        body: LayoutBuilder(
            // BoxConstraints available for responsiveness
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(children: <Widget>[
            Container(
                height: 375,
                margin: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new IntroCard(),
                      new RepCard(),
                      // TODO: partition width of intro/rep/tag evenly
                    ])),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.bottomLeft,
                child: Text.rich(
                  TextSpan(
                    text: 'Rising emails in ', // default text style
                    style: TextStyle(fontSize: 32),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'world',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32)),
                    ],
                  ),
                  textAlign: TextAlign.end,
                )),
            const Divider(
              color: Colors.white,
              height: 5,
              thickness: 1,
              indent: 18,
              endIndent: 18,
            ),
          ]);
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'New email',
          child: CustomPaint(
            child: Container(),
            foregroundPainter: AddIconPainter(),
          ),
        ));
  }
}
