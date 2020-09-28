import 'package:communique/tag/tag.dart';

import 'cacheUpdater.dart';

class LoudestTagToBrowseUpdater extends CacheUpdater {
  static Tag tagToBrowse;

  @override
  void update(dynamic tag) {
    tagToBrowse = tag;
    notifyListeners();
  }
}
