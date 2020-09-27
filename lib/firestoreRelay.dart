import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communique/email/email.dart';
import 'package:communique/tag/tag.dart';

/// Adds new email object to Firestore collection
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

/// Returns list of emails, given a snapshot of the email collection
List<Email> getEmailsFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return Email.fromSnapshot(doc);
  }).toList();
}

/// Returns a list of tags, given a snapshot of the tag collection
List<Tag> getTagsFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return Tag.fromSnapshot(doc);
  }).toList();
}

/// Returns stream of ordered QuerySnapshots, of given collection
Stream<QuerySnapshot> loadFromCollection(
    int limit, String collection, String ordinalField, bool descendingStatus) {
  return FirebaseFirestore.instance
      .collection(collection)
      .orderBy(ordinalField, descending: descendingStatus)
      .limit(limit)
      .snapshots();
}
