import 'package:communique/cache/cacheInitializer.dart';

/// Caching interface for Communique.
/// Data may be cached either using static variables in the app instance,
/// or in the browser itself using `localStorage`.
abstract class CacheUpdater extends CacheInitializer {
  void update(dynamic value);
}
