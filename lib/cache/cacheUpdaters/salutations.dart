import 'package:communique/cache/cacheUpdater.dart';

class Salutations extends CacheUpdater {
  static String name;
  static String location;

  Future<void> initSalutations() async {
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

  @override
  dynamic read() {
    return [name, location];
  }

  void updateLocation(String userLocation) {
    localStorage['communiqueUserLocation'] = userLocation;

    location = userLocation;
    notifyListeners();
  }
}
