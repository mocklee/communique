import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';
import 'package:communique/landing/loudestTags/layouts/desktopLoudest.dart';
import '../../firestoreRelay.dart' as firestoreRelay;

class LoudestTags extends StatefulWidget {
  LoudestTags({Key key}) : super(key: key);

  @override
  _LoudestTagsState createState() => _LoudestTagsState();
}

class _LoudestTagsState extends State<LoudestTags> {
  // TODO: implement loading for loudestTags
  bool _isLoading = true;
  StreamSubscription<QuerySnapshot> _tagSubscription;
  List<Tag> _tags;

  _LoudestTagsState() {
    _tagSubscription = firestoreRelay
        .loadFromCollection('tags', 'emailCount', true, 20)
        .listen(_updateLoudestTags);
  }

  @override
  void dispose() {
    super.dispose();
    _tagSubscription?.cancel();
  }

  void _updateLoudestTags(QuerySnapshot snapshot) async {
    setState(() {
      _isLoading = false;
      _tags = firestoreRelay.getTagsFromQuery(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopLoudest(_tags);
      } else {
        // TODO: implement responsiveness for loudestTags
        return DesktopLoudest(_tags);
      }
    });
  }
}
