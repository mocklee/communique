import 'package:communique/cache/cacheUpdater.dart';

class RepLevelUpdater extends CacheUpdater {
  List<bool> repLevel;

  @override
  void update(dynamic userSelectedLevels) {
    repLevel = userSelectedLevels;
    notifyListeners();
  }
}
