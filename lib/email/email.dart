import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communique/email/moderation/moderationReport.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Email {
  final UserCredential anonymousID;
  final List<String> tags;
  final int sentClickCount;
  final String title;
  final String causeSummary;
  final String subject;
  final List<String> destination;
  final String body;
  final List<ModerationReport> reports;
  final DocumentReference reference;

  Email(
      {this.anonymousID,
      this.tags,
      this.title,
      this.causeSummary,
      this.subject,
      this.destination,
      this.body})
      : sentClickCount = 0,
        reports = [],
        reference = null;

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
        reports = snapshot.data()['reports'],
        reference = snapshot.reference;
}
