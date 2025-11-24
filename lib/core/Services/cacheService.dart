/// Service for managing application cache
/// 
/// Provides in-memory caching with expiration support
class CacheService {
  static final Map<String, CacheItem> _cache = {};
  static const Duration defaultCacheDuration = Duration(minutes: 5);

  /// Stores data in cache with optional expiration duration
  /// 
  /// [key] - Unique identifier for the cached data
  /// [value] - Data to be cached
  /// [duration] - How long the data should be cached (default: 5 minutes)
  static void set(String key, dynamic value, {Duration? duration}) {
    _cache[key] = CacheItem(
      data: value,
      timestamp: DateTime.now(),
      duration: duration ?? defaultCacheDuration,
    );
  }

  /// Retrieves data from cache if it exists and hasn't expired
  /// 
  /// [key] - The identifier of the cached data
  /// 
  /// Returns the cached data if available and valid, null otherwise
  static dynamic get(String key) {
    final cached = _cache[key];
    if (cached == null) return null;

    if (DateTime.now().difference(cached.timestamp) > cached.duration) {
      _cache.remove(key);
      return null;
    }
    return cached.data;
  }

  /// Checks if a key exists in cache and is still valid
  /// 
  /// [key] - The identifier to check
  /// 
  /// Returns true if the key exists and is valid, false otherwise
  static bool has(String key) {
    final cached = _cache[key];
    if (cached == null) return false;

    if (DateTime.now().difference(cached.timestamp) > cached.duration) {
      _cache.remove(key);
      return false;
    }
    return true;
  }

  /// Removes a specific key from cache
  /// 
  /// [key] - The identifier to remove
  static void remove(String key) {
    _cache.remove(key);
  }

  /// Clears all cached data
  static void clear() {
    _cache.clear();
  }

  /// Removes all expired entries from cache
  static void cleanExpired() {
    final now = DateTime.now();
    _cache.removeWhere((key, item) =>
        now.difference(item.timestamp) > item.duration);
  }

  /// Gets cache statistics
  /// 
  /// Returns a map with cache information
  static Map<String, dynamic> getStats() {
    cleanExpired();
    return {
      'totalEntries': _cache.length,
      'keys': _cache.keys.toList(),
    };
  }
}

/// Internal class to store cache items with metadata
class CacheItem {
  final dynamic data;
  final DateTime timestamp;
  final Duration duration;

  CacheItem({
    required this.data,
    required this.timestamp,
    required this.duration,
  });
}

