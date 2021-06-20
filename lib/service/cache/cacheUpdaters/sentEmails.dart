import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../cacheUpdater.dart';

class SentEmails extends CacheUpdater {
  static List<DocumentReference> emailReferences;

  void initEmailReferences() {
    if (localStorage.containsKey('communiquéSentEmailReferences')) {
      emailReferences =
          jsonDecode(localStorage['communiquéSentEmailReferences']);
    }
  }

  @override
  void update(dynamic emailReference) {
    emailReferences.add(emailReference);
    localStorage['communiquéSentEmailReferences'] = jsonEncode(emailReferences);

    notifyListeners();
  }

  @override
  dynamic read() {
    return emailReferences;
  }
}
