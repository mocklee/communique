import 'package:flutter/material.dart';

class LevelChip extends StatefulWidget {
  @override
  LevelChipState createState() => new LevelChipState();
}

class LevelChipState extends State<LevelChip> with TickerProviderStateMixin {
  List<bool> _selectedIndex = [false, false, false, false];
  List<String> _options = ['City', 'County', 'State', 'Federal'];

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex[i],
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 5,
        pressElevation: 5,
        backgroundColor: Colors.teal,
        selectedColor: Colors.teal[300],
        onSelected: (bool selected) {
          setState(() {
            if (_selectedIndex[i] == selected)
              _selectedIndex[i] = false;
            else
              _selectedIndex[i] = selected;
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Choose level of government…',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
          Container(
            height: 45,
            child: _buildChips(),
          )
        ]);
  }
}
