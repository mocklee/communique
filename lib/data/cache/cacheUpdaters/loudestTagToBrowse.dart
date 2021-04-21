import 'package:communique/model/tag.dart';

import '../cacheUpdater.dart';

class LoudestTagToBrowse extends CacheUpdater {
  static Tag tagToBrowse;

  @override
  void update(dynamic tag) {
    tagToBrowse = tag;
    this.notifyListeners();
  }

  @override
  dynamic read() {
    return tagToBrowse;
  }
}
