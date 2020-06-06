import 'package:flutter/material.dart';
import './landing/landing.dart';

void main() {
  runApp(Communique());
}

class Communique extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Communique',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Landing(
        title: 'communique',
        subtitle: 'Let the collective voice rise.',
      ),
    );
  }
}
