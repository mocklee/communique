import 'package:firebase_auth/firebase_auth.dart';

class AnonymousFingerprint {
  static UserCredential fingerprint;

  static void create() async {
    fingerprint = await FirebaseAuth.instance.signInAnonymously();
  }
}
