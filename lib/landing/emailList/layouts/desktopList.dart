import 'package:communique/landing/emailList/tagHeader/tagHeader.dart';
import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';

class DesktopList extends StatefulWidget {
  final Tag currentTag;
  DesktopList(this.currentTag, {Key key}) : super(key: key);

  @override
  _DesktopListState createState() => _DesktopListState();
}

class _DesktopListState extends State<DesktopList> {
  @override
  Widget build(BuildContext context) {
    while (widget.currentTag == null) {
      return CircularProgressIndicator();
    }

    return (SizedBox(
        child: Column(children: <Widget>[TagHeader(widget.currentTag.name)])));
  }
}
