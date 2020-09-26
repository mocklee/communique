import 'package:cloud_firestore/cloud_firestore.dart';

//** Adds new email object to Firestore collection */
Future<void> addEmail(email) {
  final emails = FirebaseFirestore.instance.collection('emails');
  return emails.add({
    'anonymousID': email.anonymousID,
    'causeSummary': email.causeSummary,
    'body': email.emailBody,
    'destination': [email.emailDestination],
    'subject': email.subject,
    'sentClickCount': 0,
    'tags': [email.tag],
    'title': email.title,
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
