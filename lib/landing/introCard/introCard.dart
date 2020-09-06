import 'package:flutter/material.dart';
import 'package:communique/landing/introCard/layouts/desktopCard.dart';

class IntroCard extends StatelessWidget {
  IntroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return DesktopCard();
    });
  }
}
