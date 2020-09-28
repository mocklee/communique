import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';

class DesktopLoudest extends StatelessWidget {
  final List<Tag> loudestTags;
  const DesktopLoudest(this.loudestTags, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: 300,
          height: 450,
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.bottomRight,
                  child: Text.rich(
                    TextSpan(
                      text: 'Loudest topics ', // default text style
                      style: TextStyle(fontSize: 24),
                    ),
                    textAlign: TextAlign.end,
                  )),
              Divider(
                color: Colors.white,
                height: 5,
                thickness: 1,
                indent: 18,
                endIndent: 18,
              ),
            ],
          )),
    );
  }
}
