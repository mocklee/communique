import 'package:flutter/material.dart';
import 'package:communique/ui/introCard/layouts/desktopIntro.dart';

class IntroCard extends StatelessWidget {
  IntroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopIntro();
      } else {
        // TODO: implement responsiveness for IntroCard
        return DesktopIntro();
      }
    });
  }
}
