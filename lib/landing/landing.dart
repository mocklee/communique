library landing;

import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  Landing({Key key, this.title, this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            Visibility(
              visible: true,
              child: Text(
                widget.subtitle,
                style: TextStyle(
                    fontSize: 11.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.7)),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
