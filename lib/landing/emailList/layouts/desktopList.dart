import 'package:communique/landing/emailList/tagHeader/tagHeader.dart';
import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';

class DesktopList extends StatelessWidget {
  final Tag currentTag;
  const DesktopList(this.currentTag, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
        child: Column(children: <Widget>[TagHeader(currentTag.name)])));
  }
}
