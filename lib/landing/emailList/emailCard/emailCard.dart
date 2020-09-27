import 'package:flutter/material.dart';
import 'package:communique/landing/emailList/emailCard/layouts/desktopEmail.dart';

class EmailCard extends StatelessWidget {
  EmailCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopEmail();
      } else {
        return DesktopEmail();
      }
    });
  }
}
