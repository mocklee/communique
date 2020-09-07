import 'package:communique/landing/inputValidator.dart';
import 'package:communique/landing/inputUpdater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroInput extends StatefulWidget {
  @override
  _IntroInputState createState() => _IntroInputState();
}

class _IntroInputState extends State<IntroInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final _inputUpdater = InputUpdater();

  String _name, _location;
  bool _fieldSubmitted = false;

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      // update input values globally
      print("Name & city saved!");
      _inputUpdater.updateName(_name);
      _inputUpdater.updateLocation(_location);

      Scaffold.of(context).showSnackBar(
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
              height: 65,
              child: TextFormField(
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
                  labelText: 'Your formal name',
                  labelStyle: TextStyle(fontSize: 16),
                  errorStyle: TextStyle(fontSize: 11.5),
                  helperText: ' ',
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 1),
                ),
                validator: (value) {
                  return InputValidator.validateName(value);
                },
              ),
            ),
            SizedBox(
                height: 65,
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
                      errorStyle: TextStyle(fontSize: 11.5),
                      helperText: 'This card stores data only on your device. ',
                      helperStyle: TextStyle(
                          fontSize: 11.5, fontStyle: FontStyle.italic),
                      isDense: true,
                      contentPadding: EdgeInsets.only(bottom: 1),
                    ),
                    validator: (value) {
                      return InputValidator.validateLocation(value);
                    })),
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
