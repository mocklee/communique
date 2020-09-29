import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';

import 'layouts/desktopList.dart';

class EmailList extends StatelessWidget {
  final Tag tagToBrowse;
  EmailList(this.tagToBrowse, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopList(tagToBrowse);
      } else {
        // TODO: implement responsiveness for IntroCard
        return DesktopList(tagToBrowse);
      }
    });
  }
}
