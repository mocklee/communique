import 'package:flutter/foundation.dart';

class InputUpdater extends ChangeNotifier {
  // public
  String name;
  String location;
  List<bool> repLevel;

  void updateName(String userName) {
    name = userName;
    notifyListeners();
  }

  void updateLocation(String userLocation) {
    location = userLocation;
    print(location);

    notifyListeners();
  }

  void updateRepLevel(List<bool> userSelectedLevels) {
    repLevel = userSelectedLevels;
    print(repLevel);
    notifyListeners();
  }
}
