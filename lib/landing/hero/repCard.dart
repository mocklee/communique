import 'package:flutter/material.dart';

class RepCard extends StatelessWidget {
  RepCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 300,
            height: 400,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(Icons.domain),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                title: Text('Contact your representative.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              )
            ])));
  }
}
