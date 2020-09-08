import 'package:communique/landing/repCard/layouts/desktopRep.dart';
import 'package:flutter/material.dart';

class RepCard extends StatelessWidget {
  RepCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopRep();
      } else {
        return DesktopRep();
      }
    });
  }
}
