import 'package:communique/email/email.dart';
import 'package:flutter/material.dart';

class DesktopEmail extends StatefulWidget {
  final Email currentEmail;
  DesktopEmail({Key key, this.currentEmail}) : super(key: key);

  @override
  _DesktopEmailState createState() => _DesktopEmailState();
}

class _DesktopEmailState extends State<DesktopEmail> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: 375,
          height: 200,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                    title: Text(widget.currentEmail.title,
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                Row(mainAxisAlignment: MainAxisAlignment.start)
              ])),
    );
  }
}
