import 'package:fingerprintjs/fingerprintjs.dart';

class AnonymousFingerprint {
  static String fingerprint;

  static void create() async {
    fingerprint = await Fingerprint.getHash();
  }
}
