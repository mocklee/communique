import 'package:communique/data/cache/cacheInitializer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './landing/landing.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CacheInitializer(),
    child: Communique(),
  ));
}

class Communique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'communiqué',
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
        home: new Landing(
          title: 'communiqué',
          subtitle: 'Write & share email templates!',
        ));
  }
}
