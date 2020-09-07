import 'package:communique/landing/repCard/repInput.dart';
import 'package:flutter/material.dart';

class RepCard extends StatelessWidget {
  RepCard({Key key}) : super(key: key);

  final String repTitle = 'Contact your representative.';

  final String repSubtitle =
      'If your representative is not found— or you are outside the United States— use the plus button to draft an email template at the bottom right.';

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
                        top: 35,
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
