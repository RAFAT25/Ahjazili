import 'package:flutter/foundation.dart';

/// Professional logger utility for the application
/// 
/// Provides different log levels and only logs in debug mode
class AppLogger {
  /// Log debug messages (only in debug mode)
  static void debug(String message, [String? tag]) {
    if (kDebugMode) {
      final tagStr = tag != null ? '[$tag] ' : '';
      debugPrint('🔵 $tagStr$message');
    }
  }

  /// Log info messages (only in debug mode)
  static void info(String message, [String? tag]) {
    if (kDebugMode) {
      final tagStr = tag != null ? '[$tag] ' : '';
      debugPrint('ℹ️ $tagStr$message');
    }
  }

  /// Log warning messages (only in debug mode)
  static void warning(String message, [String? tag]) {
    if (kDebugMode) {
      final tagStr = tag != null ? '[$tag] ' : '';
      debugPrint('⚠️ $tagStr$message');
    }
  }

  /// Log error messages (always logged)
  static void error(String message, [Object? error, StackTrace? stackTrace, String? tag]) {
    final tagStr = tag != null ? '[$tag] ' : '';
    debugPrint('❌ $tagStr$message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace: $stackTrace');
    }
  }

  /// Log success messages (only in debug mode)
  static void success(String message, [String? tag]) {
    if (kDebugMode) {
      final tagStr = tag != null ? '[$tag] ' : '';
      debugPrint('✅ $tagStr$message');
    }
  }
}

