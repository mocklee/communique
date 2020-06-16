import 'package:flutter/material.dart';

class InfoInput extends StatefulWidget {
  @override
  _InfoInputState createState() => _InfoInputState();
}

class _InfoInputState extends State<InfoInput> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Your full name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your name.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'City, state', labelStyle: TextStyle(height: 1)),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Let them know where you are!';
                }
                return null;
              },
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 10),
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      icon: Icon(Icons.check, size: 30),
                      onPressed: () => Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Pressed'))),
                    )))
          ],
        ));
  }
}
