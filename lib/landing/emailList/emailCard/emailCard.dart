import 'package:flutter/material.dart';
import 'package:communique/landing/emailList/emailListItem.dart';
import 'package:communique/landing/emailList/emailCard/layouts/desktopEmail.dart';

class EmailCard implements EmailListItem {
  Widget buildTagHeader(BuildContext context) => null;

  Widget buildEmailCard(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopEmail();
      } else {
        // TODO: implement responsiveness for EmailCard
        return DesktopEmail();
      }
    });
  }
}
