import 'package:communique/cache/cacheUpdaters/repLevel.dart';
import 'package:communique/cache/cacheUpdaters/salutations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RepInput extends StatefulWidget {
  @override
  _RepInputState createState() => _RepInputState();
}

class _RepInputState extends State<RepInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _RepLevel = RepLevel();
  final _Salutations = Salutations();

  List<bool> _selectedIndex = [];
  List<String> _options = ['City', 'County', 'State', 'Federal'];

  String _location;
  bool _fieldSubmitted = false;

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      // update input values globally
      _Salutations.updateLocation(_location);

      // TODO: implement Google's Civic Data API & Flutter navigator
    }
  }

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      // add option as a selectable index
      _selectedIndex.add(false);

      // create option chip
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex[i],
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
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
            _RepLevel.update(_selectedIndex);
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
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 6),
                      child: Text(
                        'Choose level of government…',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: _buildChips(),
                    ),
                  )
                ]),
            SizedBox(
                height: 70,
                width: 260,
                child: TextFormField(
                  onFieldSubmitted: (location) => {
                    if (_fieldSubmitted == false)
                      {_fieldSubmitted = true, _saveInfo()}
                  },
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => {
                    setState(() {
                      _location = value;
                      _fieldSubmitted = false;
                    })
                  },
                  cursorColor: Colors.green[600],
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Location (city, state)',
                    labelStyle: TextStyle(fontSize: 16),
                    errorStyle: TextStyle(fontSize: 12),
                    helperText: "Data retrieved from Google's Civic Data API.",
                    helperStyle:
                        TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    contentPadding: EdgeInsets.only(bottom: 1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Let them know where you are!';
                    }
                    return null;
                  },
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 31),
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      tooltip: 'Find rep',
                      icon: Icon(Icons.arrow_forward, size: 30),
                      splashColor: Colors.teal[600],
                      onPressed: () =>
                          {if (_fieldSubmitted == false) _saveInfo()},
                    )))
          ],
        ));
  }
}
