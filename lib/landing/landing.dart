library landing;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communique/cache/cacheUpdaters/loudestTagToBrowse.dart';

import 'package:communique/cache/cacheUpdaters/sentEmails.dart';
import 'package:communique/landing/addIconPainter.dart';
import 'package:communique/landing/anonymousFingerprint.dart';
import 'package:communique/landing/emailList/emailList.dart';
import 'package:communique/tag/tag.dart';
import '../firestoreRelay.dart' as firestoreRelay;
import 'package:flutter/material.dart';

import './introCard/introCard.dart';
import './repCard/repCard.dart';
import 'loudestTags/loudestTags.dart';

class Landing extends StatefulWidget {
  final String title;
  final String subtitle;

  Landing({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  StreamSubscription<QuerySnapshot> _tagSubscription;
  List<Tag> loudestTags;
  LoudestTagToBrowse tagCache = new LoudestTagToBrowse();
  Tag tagToBrowse;

  _LandingState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoad());
  }

  void onLoad() {
    AnonymousFingerprint.create();
    SentEmail().initEmailReferences();
    _tagSubscription = firestoreRelay
        .loadFromCollection('tags', 'emailCount', true, 20)
        .listen((newSnapshot) {
      // set the loudest tag as browsing default
      setState(() {
        loudestTags = firestoreRelay.getTagsFromQuery(newSnapshot);
        Tag currentLoudestTag = new Tag('default', 0);
        for (int i = 0; i < loudestTags.length; i++) {
          currentLoudestTag =
              loudestTags[i].emailCount > currentLoudestTag.emailCount
                  ? loudestTags[i]
                  : currentLoudestTag;
        }
        tagToBrowse = currentLoudestTag;
      });
    });
    tagCache.addListener(() => setState(() {
          tagToBrowse = LoudestTagToBrowse.tagToBrowse;
        }));
  }

  @override
  void dispose() {
    super.dispose();
    _tagSubscription?.cancel();
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
                              new LoudestTags(loudestTags, tagCache),
                              Spacer()
                              // TODO: partition width of intro/rep/tag evenly
                            ])),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        alignment: Alignment.bottomLeft,
                        child: EmailList(tagToBrowse))
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
