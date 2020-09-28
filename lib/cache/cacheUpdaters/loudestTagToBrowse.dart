import 'package:communique/tag/tag.dart';

import '../cacheUpdater.dart';

class LoudestTagToBrowse extends CacheUpdater {
  static Tag tagToBrowse;

  @override
  void update(dynamic tag) {
    tagToBrowse = tag;
    notifyListeners();
  }
}
