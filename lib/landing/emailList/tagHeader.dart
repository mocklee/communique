import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';
import 'package:communique/landing/emailList/emailListItem.dart';

/// Rising emails header object
class TagHeader implements EmailListItem {
  final Tag currentTag;

  TagHeader(this.currentTag);

  Widget buildEmailCard(BuildContext context) => null;

  Widget buildTagHeader(BuildContext context) {
    return (Column(children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.bottomLeft,
          child: Text.rich(
            TextSpan(
              text: 'Rising emails in ' + currentTag.name, // default text style
              style: TextStyle(fontSize: 24),
              children: <TextSpan>[
                TextSpan(
                    text: 'world',
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
