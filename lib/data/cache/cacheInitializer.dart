// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/foundation.dart';

class CacheInitializer extends ValueNotifier {
  Storage localStorage = window.localStorage;

  CacheInitializer({localStorage, value}) : super(value);
}
