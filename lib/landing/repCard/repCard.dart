import 'package:flutter/material.dart';

class RepCard extends StatelessWidget {
  RepCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 300,
            height: 400,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.domain),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      title: Text('Contact your representative.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14))),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 40),
                      alignment: Alignment.center,
                      child: Text(
                        'If your representative is not found— or you are outside the United States— use the plus button to draft an email template at the bottom right.',
                        style: TextStyle(
                            fontSize: 11.5, letterSpacing: 0.4, height: 1.3),
                      ))
                ])));
  }
}
