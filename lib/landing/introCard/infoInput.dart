import 'package:communique/landing/inputUpdater/inputUpdater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoInput extends StatefulWidget {
  @override
  _InfoInputState createState() => _InfoInputState();
}

class _InfoInputState extends State<InfoInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _inputUpdater = InputUpdater();

  String _name, _location;
  bool _fieldSubmitted = false;

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      print(_fieldSubmitted);
      // update input values globally
      _inputUpdater.updateName(_name);
      _inputUpdater.updateLocation(_location);

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Info saved!')));
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
                onFieldSubmitted: (location) => {_saveInfo()},
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
                  labelText: 'Your full name',
                  labelStyle: TextStyle(fontSize: 16),
                  errorStyle: TextStyle(fontSize: 11.5),
                  helperText: ' ',
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 1),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
                height: 65,
                child: TextFormField(
                  onFieldSubmitted: (location) => {_saveInfo()},
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
                    helperText: 'This card stores data only on your device.',
                    helperStyle:
                        TextStyle(fontSize: 11.5, fontStyle: FontStyle.italic),
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Let them know where you are!';
                    }
                    return null;
                  },
                )),
          ],
        ));
  }
}
