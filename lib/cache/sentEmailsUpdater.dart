import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'cacheUpdater.dart';

class SentEmailUpdater extends CacheUpdater {
  static List<DocumentReference> emailReferences;

  @override
  void update(dynamic emailReference) {
    emailReferences.add(emailReference);
    localStorage['communiqueSentEmailReferences'] = jsonEncode(emailReferences);

    notifyListeners();
  }

  void initEmailReferences() {
    if (localStorage.containsKey('communiqueSentEmailReferences')) {
      emailReferences =
          jsonDecode(localStorage['communiqueSentEmailReferences']);
    }
  }
}
