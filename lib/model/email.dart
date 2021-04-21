import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Email object that encapsulates what users can submit in regards to site content.
class Email {
  final UserCredential anonymousID;
  final List<String> tags;
  final String title;
  final String causeSummary;
  final String subject;
  final List<String> destination;
  final String body;
  final DocumentReference reference;
  int sentClickCount;

  Email(
      {this.anonymousID,
      this.tags,
      this.title,
      this.causeSummary,
      this.sentClickCount,
      this.subject,
      this.destination,
      this.body})
      : reference = null;

  Email.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        anonymousID = snapshot.data()['anonymousID'],
        tags = snapshot.data()['tags'],
        sentClickCount = snapshot.data()['sentClickCount'],
        title = snapshot.data()['title'],
        causeSummary = snapshot.data()['causeSummary'],
        subject = snapshot.data()['subject'],
        destination = snapshot.data()['destination'],
        body = snapshot.data()['body'],
        reference = snapshot.reference;
}
