import 'package:communique/landing/emailCard/emailCard.dart';
import 'package:communique/landing/emailList/tagHeader/tagHeader.dart';
import 'package:communique/model/tag.dart';
import 'package:flutter/material.dart';

class DesktopList extends StatefulWidget {
  final Tag currentTag;
  final List<EmailCard> emailCards;
  DesktopList(this.currentTag, this.emailCards, {Key key}) : super(key: key);

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
        child: Column(children: <Widget>[
      TagHeader(widget.currentTag.name),
      SizedBox(child: null // TODO: write builder method for emailCard list
          )
    ])));
  }
}
