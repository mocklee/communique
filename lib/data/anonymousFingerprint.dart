import 'package:firebase_auth/firebase_auth.dart';

/// User credential object provided by Firebase anonymous authentication.
class AnonymousFingerprint {
  static UserCredential fingerprint;

  static void create() async {
    fingerprint = await FirebaseAuth.instance.signInAnonymously();
  }
}
