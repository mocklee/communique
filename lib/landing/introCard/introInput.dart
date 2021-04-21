import 'package:communique/data/cache/cacheUpdaters/salutations.dart';
import 'package:communique/landing/inputValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class IntroInput extends StatefulWidget {
  @override
  _IntroInputState createState() => _IntroInputState();
}

class _IntroInputState extends State<IntroInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final _salutations = Salutations();
  String _name, _location;
  bool _fieldSubmitted = false;

  _IntroInputState() {
    _salutations.initSalutations();
    _name = Salutations.name;
    _location = Salutations.location;
  }

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      // update input values globally
      print("Name & city saved!");
      _salutations.update(_name);
      _salutations.updateLocation(_location);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Name & city saved to your browser!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 70,
                child: TextFormField(
                  initialValue: (_name != null) ? _name : '',
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => {
                    setState(() {
                      _name = value;
                      _fieldSubmitted = false;
                    })
                  },
                  cursorColor: Colors.green[600],
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Formal name',
                    labelStyle: TextStyle(fontSize: 16),
                    errorStyle: TextStyle(fontSize: 12),
                    helperText: ' ',
                    contentPadding: EdgeInsets.only(bottom: 1),
                  ),
                  validator: (value) {
                    return InputValidator.validateName(value);
                  },
                )),
            SizedBox(
                height: 70,
                child: TextFormField(
                    initialValue: (_location != null) ? _location : '',
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
                      labelText: 'Location',
                      labelStyle: TextStyle(fontSize: 16),
                      errorStyle: TextStyle(fontSize: 12),
                      helperText: 'This card stores data only on your device. ',
                      helperStyle:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      contentPadding: EdgeInsets.only(bottom: 1),
                    ),
                    validator: (value) {
                      return InputValidator.validateLocation(value);
                    })),
            Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 0),
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      tooltip: 'Save',
                      icon: Icon(Icons.check, size: 30),
                      splashColor: Colors.teal[600],
                      onPressed: () =>
                          {if (_fieldSubmitted == false) _saveInfo()},
                    )))
          ],
        ));
  }
}
