import 'package:flutter/foundation.dart';

class InputUpdater extends ChangeNotifier {
  // public
  String name;
  String location;

  void updateName(String userName) {
    name = userName;
    print(name);
    notifyListeners();
  }

  void updateLocation(String userLocation) {
    location = userLocation;
    print(location);
    notifyListeners();
  }
}
