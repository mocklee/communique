import 'package:communique/cache/sentEmailUpdater.dart';
import 'package:communique/email/email.dart';
import 'package:flutter/material.dart';

class DesktopEmail extends StatefulWidget {
  final Email currentEmail;

  DesktopEmail(this.currentEmail, {Key key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SentEmailUpdater.emailReferences
                            .contains(widget.currentEmail.reference)
                        ? Icon(Icons.mark_email_read,
                            size: 14.0,
                            semanticLabel: 'You have already sent this email.')
                        : Icon(
                            Icons.email,
                            size: 14.0,
                            semanticLabel: 'You have not yet sent this email.',
                          ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
                    Text(widget.currentEmail.sentClickCount.toString())
                  ],
                )
              ])),
    );
  }
}
