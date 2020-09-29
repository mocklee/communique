import 'package:flutter/material.dart';

/// Rising emails header object
class TagHeader extends StatelessWidget {
  final String currentTagName;
  const TagHeader(this.currentTagName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.bottomLeft,
          child: Text.rich(
            TextSpan(
              text: 'Rising emails in ', // default text style
              style: TextStyle(fontSize: 24),
              children: <TextSpan>[
                TextSpan(
                    text: currentTagName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
            textAlign: TextAlign.end,
          )),
      Divider(
        color: Colors.white,
        height: 5,
        thickness: 1,
        indent: 18,
        endIndent: 18,
      )
    ]));
  }
}
