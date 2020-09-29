import 'package:flutter/material.dart';

/// Rising emails header object
class TagHeader extends StatelessWidget {
  final String currentTagName;
  TagHeader(this.currentTagName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController selectedTag = TextEditingController();
    selectedTag.text = currentTagName;
    return (Column(children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.bottomLeft,
          child: Text.rich(
            TextSpan(
                text: 'Rising emails in ', // default text style
                style: TextStyle(fontSize: 24),
                children: <InlineSpan>[
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6))),
                  WidgetSpan(
                      child: IntrinsicWidth(
                          child: TextField(
                    controller: selectedTag,
                    decoration: InputDecoration(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ))),
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: IconButton(
                              onPressed: () => {null},
                              padding: new EdgeInsets.all(0.0),
                              tooltip: 'Find rep',
                              icon: Icon(Icons.search, size: 30),
                              splashColor: Colors.teal[600])))
                ]),
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
