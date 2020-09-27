import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:convert';

class InputUpdater extends ChangeNotifier {
  static String name;
  static String location;
  static List<bool> repLevel;
  static List<DocumentReference> sentEmailReferences;

  void updateName(String userName) {
    window.localStorage['communiqueUserName'] = userName;

    name = userName;
    notifyListeners();
  }

  void updateLocation(String userLocation) {
    window.localStorage['communiqueUserLocation'] = userLocation;

    location = userLocation;
    notifyListeners();
  }

  void updateRepLevel(List<bool> userSelectedLevels) {
    repLevel = userSelectedLevels;
    notifyListeners();
  }

  void updateSentEmailCache(DocumentReference emailReference) {
    if (window.localStorage.containsKey('communiqueSentEmailReferences')) {
      sentEmailReferences =
          jsonDecode(window.localStorage['communiqueSentEmailReferences']);
    }

    sentEmailReferences.add(emailReference);
    window.localStorage['communiqueSentEmailReferences'] =
        jsonEncode(sentEmailReferences);

    notifyListeners();
  }
}
