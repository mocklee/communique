import 'package:flutter/material.dart';

/// Rising emails header object
class TagSearch extends StatefulWidget {
  final String currentTagName;
  const TagSearch(this.currentTagName);

  @override
  _TagSearchState createState() => _TagSearchState();
}

class _TagSearchState extends State<TagSearch> {
  FocusNode tagSearchFocusNode;

  @override
  void initState() {
    super.initState();

    tagSearchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    tagSearchFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController selectedTag = TextEditingController();
    selectedTag.text = widget.currentTagName;
    return (Column(children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                          child: ConstrainedBox(
                              constraints: new BoxConstraints(
                                minWidth: 150.0,
                                maxWidth: 400.0,
                              ),
                              child: TextField(
                                focusNode: tagSearchFocusNode,
                                controller: selectedTag,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  isDense: true,
                                ),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            )
                      ))
                  ),
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: IconButton(
                              onPressed: () => {
                                tagSearchFocusNode.requestFocus(),
                                selectedTag.clear()
                                },
                              padding: new EdgeInsets.all(0.0),
                              tooltip: 'Find topic',
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
