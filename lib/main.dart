import 'package:flutter/material.dart';
import './landing/landing.dart';

void main() {
  runApp(Communique());
}

class Communique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'communique',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.lime,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Landing(
        title: 'communique',
        subtitle: 'Write & share email templates!',
      ),
    );
  }
}
