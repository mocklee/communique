import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communique/email/email.dart';

//** Adds new email object to Firestore collection */
Future<void> addEmail(Email email) {
  final emails = FirebaseFirestore.instance.collection('emails');
  return emails.add({
    'anonymousID': email.anonymousID,
    'tags': email.tags,
    'title': email.title,
    'causeSummary': email.causeSummary,
    'subject': email.subject,
    'destination': email.destination,
    'body': email.body,
  });
}

//** Returns list of emails with given parameters */
List<Email> getEmailsFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return Email.fromSnapshot(doc);
  }).toList();
}

//** Returns snapshot of email collection */
Stream<QuerySnapshot> loadFromCollection(int limit) {
  return FirebaseFirestore.instance
      .collection('emails')
      .orderBy('sentClickCount', descending: true)
      .limit(limit)
      .snapshots();
}
