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
        appBar: AppBar(
            title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text(widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Visibility(
                  visible: true,
                  child: Text(
                    widget.subtitle,
                    style: TextStyle(
                        fontSize: 11.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white.withOpacity(0.7)),
                  ))
            ])),
        body: LayoutBuilder(
            // BoxConstraints available for responsiveness
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
              height: 375,
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new IntroCard(),
                    new RepCard(),
                  ]));
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
