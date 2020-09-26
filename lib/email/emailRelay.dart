import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addEmail(email) {
  final emails = FirebaseFirestore.instance.collection('emails');
  return emails.add({
    'anonymousID': email.anonymousID,
    'causeSummary': email.causeSummary,
    'emailbody': email.emailBody,
    'emailDestination': [email.emailDestination],
    'emailSubject': email.subject,
    'sentClickCount': 0,
    'tags': [email.tag],
    'title': email.title,
  });
}

//** Returns snapshot of Firestore collection */
Stream<QuerySnapshot> loadFromCollection() {
  return FirebaseFirestore.instance
      .collection('emails')
      .orderBy('sentClickCount', descending: true)
      .limit(50)
      .snapshots();
}
