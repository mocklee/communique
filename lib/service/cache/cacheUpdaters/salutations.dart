import 'package:communique/service/cache/cacheUpdater.dart';

class Salutations extends CacheUpdater {
  static String name;
  static String location;

  Future<void> initSalutations() async {
    if (localStorage.containsKey('communiquéUserName') &&
        localStorage.containsKey('communiquéUserLocation')) {
      name = localStorage['communiquéUserName'];
      location = localStorage['communiquéUserLocation'];
    }
  }

  @override
  void update(dynamic userName) {
    localStorage['communiquéUserName'] = userName;

    name = value;
    notifyListeners();
  }

  @override
  dynamic read() {
    return [name, location];
  }

  void updateLocation(String userLocation) {
    localStorage['communiquéUserLocation'] = userLocation;

    location = userLocation;
    notifyListeners();
  }
}
