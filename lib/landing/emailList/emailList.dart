import 'package:communique/cache/cacheUpdaters/loudestTagToBrowse.dart';
import 'package:flutter/material.dart';

import 'layouts/desktopList.dart';

class EmailList extends StatefulWidget {
  EmailList({Key key}) : super(key: key);

  @override
  _EmailListState createState() => _EmailListState();
}

class _EmailListState extends State<EmailList> {
  @override
  Widget build(BuildContext context) {
    while (LoudestTagToBrowse.tagToBrowse == null) {
      return CircularProgressIndicator();
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopList(LoudestTagToBrowse.tagToBrowse);
      } else {
        // TODO: implement responsiveness for IntroCard
        return DesktopList(LoudestTagToBrowse.tagToBrowse);
      }
    });
  }
}
