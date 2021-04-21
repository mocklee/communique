import 'package:communique/data/cache/cacheUpdater.dart';

class RepLevel extends CacheUpdater {
  List<bool> repLevel;

  @override
  void update(dynamic userSelectedLevels) {
    repLevel = userSelectedLevels;
    notifyListeners();
  }

  @override
  dynamic read() {
    return repLevel;
  }
}
