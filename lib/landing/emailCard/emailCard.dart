import 'package:communique/model/email.dart';
import 'package:flutter/material.dart';
import 'package:communique/landing/emailCard/layouts/desktopEmail.dart';

class EmailCard extends StatefulWidget {
  final Email currentEmail;
  EmailCard(this.currentEmail, {Key key}) : super(key: key);

  @override
  _EmailCardState createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopEmail(widget.currentEmail);
      } else {
        // TODO: implement responsiveness for EmailCard
        return DesktopEmail(widget.currentEmail);
      }
    }));
  }
}
