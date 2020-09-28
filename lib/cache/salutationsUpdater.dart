import 'package:communique/cache/cacheUpdater.dart';

class SalutationsUpdater extends CacheUpdater {
  static String name;
  static String location;

  void initSalutations() {
    if (localStorage.containsKey('communiqueUserName') &&
        localStorage.containsKey('communiqueUserLocation')) {
      name = localStorage['communiqueUserName'];
      location = localStorage['communiqueUserLocation'];
    }
  }

  @override
  void update(dynamic userName) {
    localStorage['communiqueUserName'] = userName;

    name = value;
    notifyListeners();
  }

  void updateLocation(String userLocation) {
    localStorage['communiqueUserLocation'] = userLocation;

    location = userLocation;
    notifyListeners();
  }
}
