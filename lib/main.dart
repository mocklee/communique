import 'package:communique/landing/inputUpdater/inputUpdater.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './landing/landing.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => InputUpdater(),
    child: Communique(),
  ));
}

class Communique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'communique',
        theme: ThemeData(
          primaryColor: Colors.teal,
          primarySwatch: Colors.teal,
          brightness: Brightness.dark,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.teal[200],
              foregroundColor: Colors.white,
              splashColor: Colors.teal[600]),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // the meat
        home: new Landing(
          title: 'communique',
          subtitle: 'Write & share email templates!',
        ));
  }
}
