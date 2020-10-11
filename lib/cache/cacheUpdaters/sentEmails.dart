import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../cacheUpdater.dart';

class SentEmail extends CacheUpdater {
  static List<DocumentReference> emailReferences;

  void initEmailReferences() {
    if (localStorage.containsKey('communiqueSentEmailReferences')) {
      emailReferences =
          jsonDecode(localStorage['communiqueSentEmailReferences']);
    }
  }

  @override
  void update(dynamic emailReference) {
    emailReferences.add(emailReference);
    localStorage['communiqueSentEmailReferences'] = jsonEncode(emailReferences);

    notifyListeners();
  }

  @override
  dynamic read() {
    return emailReferences;
  }
}
