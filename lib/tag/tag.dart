import 'package:cloud_firestore/cloud_firestore.dart';

/// Tag object that lends emails one or more topics to categorize by.
class Tag {
  final String name;
  int emailCount;
  final DocumentReference reference;

  Tag(this.name, this.emailCount) : reference = null;

  Tag.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        name = snapshot.data()['name'],
        emailCount = snapshot.data()['emailCount'],
        reference = snapshot.reference;
}
