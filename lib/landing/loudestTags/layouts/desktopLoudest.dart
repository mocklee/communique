import 'package:communique/data/cache/cacheUpdaters/loudestTagToBrowse.dart';
import 'package:communique/model/tag.dart';
import 'package:flutter/material.dart';

class DesktopLoudest extends StatefulWidget {
  final List<Tag> loudestTags;
  final LoudestTagToBrowse tagCache;

  DesktopLoudest(this.loudestTags, this.tagCache, {Key key}) : super(key: key);

  @override
  _DesktopLoudestState createState() => _DesktopLoudestState();
}

class _DesktopLoudestState extends State<DesktopLoudest> {
  Widget _buildChips() {
    List<Widget> chips = new List();

    while (widget.loudestTags == null) {
      return CircularProgressIndicator();
    }

    for (int i = 0; i < widget.loudestTags.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: (LoudestTagToBrowse.tagToBrowse == widget.loudestTags[i])
            ? true
            : false,
        label: Text(widget.loudestTags[i].name,
            style: TextStyle(color: Colors.white)),
        elevation: 4,
        pressElevation: 2,
        backgroundColor: Colors.teal,
        selectedColor: Colors.teal[300],
        onSelected: (bool selected) {
          setState(() {
            widget.tagCache.update(widget.loudestTags[i]);
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return Wrap(
      direction: Axis.vertical,
      children: chips,
    );
  }

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
              SizedBox(width: 300, height: 322, child: _buildChips())
            ],
          )),
    );
  }
}
