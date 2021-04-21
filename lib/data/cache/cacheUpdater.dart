import 'package:communique/data/cache/cacheInitializer.dart';

/// Caching interface for Communiqué.
/// Data may be cached either using static variables in the app instance,
/// or in the browser itself using `localStorage`.
abstract class CacheUpdater extends CacheInitializer {
  void update(dynamic value);
  dynamic read();
}
