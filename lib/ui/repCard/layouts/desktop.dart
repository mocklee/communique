import 'package:flutter/material.dart';
import 'package:communique/ui/repCard/repInput.dart';

class DesktopRep extends StatelessWidget {
  const DesktopRep({Key key}) : super(key: key);

  final String repTitle = 'Contact your representative.';

  final String repSubtitle =
      'Make your voice heard by those in government! If a representative is not found, use the plus button at the bottom right to create an email template.';

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 350,
            height: 450,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.domain),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      title: Text(repTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
                  Container(
                      padding: EdgeInsets.only(
                        top: 25,
                        bottom: 28,
                        right: 20,
                        left: 20,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        repSubtitle,
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 0.4,
                          height: 1.3,
                        ),
                      )),
                  RepInput(),
                ])));
  }
}
