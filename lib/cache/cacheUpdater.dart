import 'package:flutter/foundation.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

/// Caching interface for Communique.
/// Data may be cached either using static variables in the app instance,
/// or in the browser itself using `localStorage`.
abstract class CacheUpdater extends ValueNotifier {
  Storage localStorage = window.localStorage;
  CacheUpdater({this.localStorage, value}) : super(value);

  void update(dynamic value);
}
