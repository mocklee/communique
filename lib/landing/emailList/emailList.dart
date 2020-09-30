import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communique/email/email.dart';
import 'package:communique/landing/emailList/emailCard/emailCard.dart';
import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';

import 'layouts/desktopList.dart';
import '../../firestoreRelay.dart' as firestoreRelay;

class EmailList extends StatefulWidget {
  final Tag tagToBrowse;
  EmailList(this.tagToBrowse, {Key key}) : super(key: key);

  @override
  _EmailListState createState() => _EmailListState();
}

class _EmailListState extends State<EmailList> {
  StreamSubscription<QuerySnapshot> _filteredEmailSubscription;
  List<Email> _emails;
  List<EmailCard> _emailCards = [];

  _EmailListState() {
    onLoad();
  }

  void onLoad() {
    _filteredEmailSubscription = firestoreRelay
        .loadFromFilteredCollection(
            'emails', 'sentClickCount', true, 'tags', widget.tagToBrowse)
        .listen((newSnapshot) {
      List<Email> newEmails = firestoreRelay.getEmailsFromQuery(newSnapshot);

      updateEmailCardList(newEmails);
    });
  }

  void updateEmailCardList(List<Email> newEmails) {
    newEmails.removeWhere((email) => _emails.contains(email));

    for (int i = 0; i < newEmails.length; i++) {
      _emailCards.add(new EmailCard(newEmails[i]));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _filteredEmailSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopList(widget.tagToBrowse, _emailCards);
      } else {
        // TODO: implement responsiveness for IntroCard
        return DesktopList(widget.tagToBrowse, _emailCards);
      }
    });
  }
}
