import 'package:communique/landing/business/inputValidator.dart';
import 'package:communique/landing/business/inputUpdater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoInput extends StatefulWidget {
  @override
  _InfoInputState createState() => _InfoInputState();
}

class _InfoInputState extends State<InfoInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FocusNode _nameFocus;
  FocusNode _locationFocus;
  FocusNode _saveFocus;
  final _inputUpdater = InputUpdater();

  String _name, _location;
  bool _fieldSubmitted = false;
  bool _tabbedRecently = false;

  @override
  void initState() {
    super.initState();

    _nameFocus = FocusNode();
    _locationFocus = FocusNode();
    _saveFocus = FocusNode();
  }

  @override
  void dispose() {
    // clean up focus nodes when form is disposed
    _nameFocus.dispose();
    _locationFocus.dispose();
    _saveFocus.dispose();

    super.dispose();
  }

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      // update input values globally
      print("Name & city saved!");
      _inputUpdater.updateName(_name);
      _inputUpdater.updateLocation(_location);

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Name & city saved!')));
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
                child: RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (key) {
                    RawKeyEventDataWeb kData = key.data;
                    if (kData.keyLabel == 'Tab' &&
                        !_tabbedRecently &&
                        _nameFocus.hasFocus) {
                      FocusScope.of(context).requestFocus(_locationFocus);
                      // prevent requestFocus from firing repeatedly as tab key is held
                      _tabbedRecently = true;
                      Future.delayed(Duration(milliseconds: 55),
                          () => _tabbedRecently = false);
                    }
                  },
                  child: TextFormField(
                    focusNode: _nameFocus,
                    autocorrect: false,
                    onEditingComplete: () => _locationFocus.requestFocus(),
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
                      return InputValidator.validateName(value);
                    },
                  ),
                )),
            SizedBox(
                height: 65,
                child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (key) {
                      RawKeyEventDataWeb kData = key.data;
                      if (kData.keyLabel == 'Tab' &&
                          !_tabbedRecently &&
                          _locationFocus.hasFocus) {
                        FocusScope.of(context).requestFocus(_saveFocus);
                        // prevent requestFocus from firing repeatedly as tab key is held
                        _tabbedRecently = true;
                        Future.delayed(Duration(milliseconds: 55),
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
                          return InputValidator.validateLocation(value);
                        }))),
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
                              _saveFocus.hasFocus) {
                            FocusScope.of(context).requestFocus(_nameFocus);
                            // prevent requestFocus from firing repeatedly as tab key is held
                            _tabbedRecently = true;
                            Future.delayed(Duration(milliseconds: 55),
                                () => _tabbedRecently = false);
                          }
                          if (kData.keyLabel == 'Enter' &&
                              _saveFocus.hasFocus) {
                            if (_fieldSubmitted == false) _saveInfo();
                          }
                        },
                        child: IconButton(
                          focusNode: _saveFocus,
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
