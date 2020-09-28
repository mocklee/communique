import 'package:communique/email/email.dart';
import 'package:flutter/material.dart';
import 'package:communique/landing/emailList/emailListItem.dart';
import 'package:communique/landing/emailList/emailCard/layouts/desktopEmail.dart';

class EmailCard implements EmailListItem {
  final Email currentEmail;
  EmailCard(this.currentEmail);

  Widget buildTagHeader(BuildContext context) => null;

  Widget buildEmailCard(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopEmail(this.currentEmail);
      } else {
        // TODO: implement responsiveness for EmailCard
        return DesktopEmail(this.currentEmail);
      }
    });
  }
}
