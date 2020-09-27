library landing;

import 'package:communique/landing/addIconPainter.dart';
import 'package:communique/landing/anonymousFingerprint.dart';
import 'package:communique/landing/loudestTags/loudestTags.dart';
import 'package:flutter/material.dart';

import './introCard/introCard.dart';
import './repCard/repCard.dart';

class Landing extends StatefulWidget {
  final String title;
  final String subtitle;

  Landing({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    super.initState();

    // sign in anonymously on page load
    WidgetsBinding.instance
        .addPostFrameCallback((_) => AnonymousFingerprint.create());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
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
          return Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: 1200,
                  child: Column(children: <Widget>[
                    Container(
                        height: 375,
                        margin: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Spacer(),
                              new IntroCard(),
                              Spacer(flex: 1),
                              new RepCard(),
                              Spacer(),
                              new LoudestTags(),
                              Spacer()
                              // TODO: partition width of intro/rep/tag evenly
                            ])),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        alignment: Alignment.bottomLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'Rising emails in ', // default text style
                            style: TextStyle(fontSize: 24),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'world',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
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
                  ])));
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'New email',
          child: CustomPaint(
            child: Container(),
            foregroundPainter: AddIconPainter(),
          ),
        ));
  }
}
