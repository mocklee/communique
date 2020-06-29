import 'package:communique/landing/business/inputUpdater.dart';
import 'package:communique/landing/business/tabDelay.dart';
import 'package:communique/landing/business/repFocusUpdater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RepInput extends StatefulWidget {
  @override
  _RepInputState createState() => _RepInputState();
}

class _RepInputState extends State<RepInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _inputUpdater = InputUpdater();
  final _focusUpdater = RepFocusUpdater();
  final _tabDelay = TabDelay();

  List<bool> _selectedIndex = [false, false, false, false];
  List<String> _options = ['City', 'County', 'State', 'Federal'];

  String _location;
  bool _fieldSubmitted = false;

  @override
  void initState() {
    super.initState();
    _focusUpdater.repInit();
  }

  @override
  void dispose() {
    // clean up focus nodes when form is disposed
    super.dispose();
    _focusUpdater.repDispose();
  }

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      // update input values globally
      _inputUpdater.updateLocation(_location);

      // TODO: implement Google's Civic Data API & Flutter navigator
    }
  }

  Widget _buildChips() {
    List<Widget> chips = new List();
    List<FocusNode> _chipFocus = [
      _focusUpdater.cityFocus,
      _focusUpdater.countyFocus,
      _focusUpdater.stateFocus,
      _focusUpdater.federalFocus
    ];

    for (int i = 0; i < _options.length; i++) {
      FocusNode nextFocus = (i + 1 > _options.length)
          ? _focusUpdater.locationFocus
          : _chipFocus[i];
      RawKeyboardListener choiceChip = RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (key) {
            RawKeyEventDataWeb kData = key.data;
            if (kData.keyLabel == 'Tab' &&
                !_tabDelay.tabbedRecently &&
                _chipFocus[i].hasFocus) {
              FocusScope.of(context).requestFocus(nextFocus);
              // prevent requestFocus from firing repeatedly as tab key is held
              _tabDelay.haveTabbedRecently();
            }
          },
          child: ChoiceChip(
            selected: _selectedIndex[i],
            label: Text(_options[i], style: TextStyle(color: Colors.white)),
            focusNode: _chipFocus[i],
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
                _inputUpdater.updateRepLevel(_selectedIndex);
              });
            },
          ));

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
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        'Choose level of government…',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Container(
                      height: 40,
                      child: _buildChips(),
                    ),
                  )
                ]),
            SizedBox(
                height: 65,
                width: 260,
                child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (key) {
                      RawKeyEventDataWeb kData = key.data;
                      if (kData.keyLabel == 'Tab' &&
                          !_tabDelay.tabbedRecently &&
                          _focusUpdater.locationFocus.hasFocus) {
                        FocusScope.of(context)
                            .requestFocus(_focusUpdater.searchFocus);
                        // prevent requestFocus from firing repeatedly as tab key is held
                        _tabDelay.haveTabbedRecently();
                      }
                    },
                    child: TextFormField(
                      focusNode: _focusUpdater.locationFocus,
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
                        labelText: 'City, state',
                        labelStyle: TextStyle(fontSize: 16),
                        errorStyle: TextStyle(fontSize: 11.5),
                        helperText:
                            "Data retrieved from Google's Civic Data API.",
                        helperStyle: TextStyle(
                            fontSize: 11.5, fontStyle: FontStyle.italic),
                        isDense: true,
                        contentPadding: EdgeInsets.only(bottom: 1),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Let them know where you are!';
                        }
                        return null;
                      },
                    ))),
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 31),
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (key) {
                          RawKeyEventDataWeb kData = key.data;
                          if (kData.keyLabel == 'Tab' &&
                              !_tabDelay.tabbedRecently &&
                              _focusUpdater.searchFocus.hasFocus) {
                            FocusScope.of(context).requestFocus(_focusUpdater.);
                            // prevent requestFocus from firing repeatedly as tab key is held
                            _tabDelay.haveTabbedRecently();
                          }
                          if (kData.keyLabel == 'Enter' &&
                              _focusUpdater.searchFocus.hasFocus) {
                            if (_fieldSubmitted == false) _saveInfo();
                          }
                        },
                        child: IconButton(
                          focusNode: _focusUpdater.searchFocus,
                          padding: new EdgeInsets.all(0.0),
                          tooltip: 'Find rep',
                          icon: Icon(Icons.search, size: 30),
                          splashColor: Colors.teal[600],
                          onPressed: () =>
                              {if (_fieldSubmitted == false) _saveInfo()},
                        ))))
          ],
        ));
  }
}
