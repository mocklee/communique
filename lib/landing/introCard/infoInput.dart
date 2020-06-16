import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoInput extends StatefulWidget {
  @override
  _InfoInputState createState() => _InfoInputState();
}

class _InfoInputState extends State<InfoInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _nameFocus = FocusNode();
  final _locationFocus = FocusNode();

  void _submitInfo() {
    if (_formKey.currentState.validate()) {
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
                focusNode: _nameFocus,
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
                  focusNode: _locationFocus,
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
                      onPressed: () => _submitInfo(),
                    )))
          ],
        ));
  }
}
