import 'package:flutter/material.dart';
import './landing/landing.dart';

void main() {
  runApp(Communique());
}

class Communique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Communique',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
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
