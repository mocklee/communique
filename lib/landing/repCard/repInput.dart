import 'package:communique/landing/business/inputUpdater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RepInput extends StatefulWidget {
  @override
  _RepInputState createState() => _RepInputState();
}

class _RepInputState extends State<RepInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<bool> _selectedIndex = [false, false, false, false];
  List<String> _options = ['City', 'County', 'State', 'Federal'];

  String _name, _location;
  bool _fieldSubmitted = false;

  bool _tabbedRecently = false;
  FocusNode _cityFocus;
  FocusNode _countyFocus;
  FocusNode _stateFocus;
  FocusNode _federalFocus;
  FocusNode _locationFocus;
  FocusNode _searchFocus;

  final _inputUpdater = InputUpdater();

  @override
  void initState() {
    super.initState();

    _cityFocus = FocusNode();
    _countyFocus = FocusNode();
    _stateFocus = FocusNode();
    _federalFocus = FocusNode();
    _locationFocus = FocusNode();
    _searchFocus = FocusNode();
  }

  @override
  void dispose() {
    // clean up focus nodes when form is disposed
    super.dispose();

    _cityFocus.dispose();
    _countyFocus.dispose();
    _stateFocus.dispose();
    _federalFocus.dispose();
    _locationFocus.dispose();
    _searchFocus.dispose();
  }

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      // update input values globally
      _inputUpdater.updateName(_name);
      _inputUpdater.updateLocation(_location);

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved!')));
    }
  }

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
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
            _inputUpdater.updateRepLevel(_selectedIndex);
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
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        'Choose level of government…',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                  Container(
                    height: 45,
                    child: _buildChips(),
                  ),
                ]),
            SizedBox(
                height: 65,
                child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (key) {
                      RawKeyEventDataWeb kData = key.data;
                      if (kData.keyLabel == 'Tab' &&
                          !_tabbedRecently &&
                          _locationFocus.hasFocus) {
                        FocusScope.of(context).requestFocus(_searchFocus);
                        // prevent requestFocus from firing repeatedly as tab key is held
                        _tabbedRecently = true;
                        Future.delayed(Duration(milliseconds: 70),
                            () => _tabbedRecently = false);
                      }
                    },
                    child: TextFormField(
                      focusNode: _locationFocus,
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
                            'This card stores data only on your device.',
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
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (key) {
                          RawKeyEventDataWeb kData = key.data;
                          if (kData.keyLabel == 'Tab' &&
                              !_tabbedRecently &&
                              _searchFocus.hasFocus) {
                            FocusScope.of(context).requestFocus();
                            // prevent requestFocus from firing repeatedly as tab key is held
                            _tabbedRecently = true;
                            Future.delayed(Duration(milliseconds: 55),
                                () => _tabbedRecently = false);
                          }
                          if (kData.keyLabel == 'Enter' &&
                              _searchFocus.hasFocus) {
                            if (_fieldSubmitted == false) _saveInfo();
                          }
                        },
                        child: IconButton(
                          focusNode: _searchFocus,
                          padding: new EdgeInsets.all(0.0),
                          tooltip: 'Save',
                          icon: Icon(Icons.check, size: 30),
                          splashColor: Colors.teal[600],
                          onPressed: () =>
                              {if (_fieldSubmitted == false) _saveInfo()},
                        ))))
          ],
        ));
  }
}
