import 'package:communique/cache/cacheUpdaters/loudestTagToBrowse.dart';
import 'package:communique/tag/tag.dart';
import 'package:flutter/material.dart';
import 'package:communique/landing/loudestTags/layouts/desktopLoudest.dart';

class LoudestTags extends StatelessWidget {
  final List<Tag> tags;
  final LoudestTagToBrowse tagCache;

  LoudestTags(this.tags, this.tagCache, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopLoudest(tags, tagCache);
      } else {
        // TODO: implement responsiveness for loudestTags
        return DesktopLoudest(tags, tagCache);
      }
    });
  }
}
