import 'package:communique/cacheUpdater.dart';
import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';

class DesktopLoudest extends StatefulWidget {
  final List<Tag> loudestTags;

  DesktopLoudest(this.loudestTags, {Key key}) : super(key: key);

  @override
  _DesktopLoudestState createState() => _DesktopLoudestState();
}

class _DesktopLoudestState extends State<DesktopLoudest> {
  final _cacheUpdater = CacheUpdater();

  List<bool> _selectedIndex;

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < widget.loudestTags.length; i++) {
      _selectedIndex[i] = false;
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex[i],
        label: Text(widget.loudestTags[i].name,
            style: TextStyle(color: Colors.white)),
        elevation: 4,
        pressElevation: 2,
        backgroundColor: Colors.teal,
        selectedColor: Colors.teal[300],
        onSelected: (bool selected) {
          setState(() {
            if (_selectedIndex[i] == selected)
              _selectedIndex[i] = false;
            else
              _selectedIndex[i] = selected;
            _cacheUpdater.updateRepLevel(_selectedIndex);
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return Wrap(
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
            ],
          )),
    );
  }
}
