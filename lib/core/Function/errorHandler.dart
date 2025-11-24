import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../Class/StatusRequest.dart';
import 'logger.dart';

/// Centralized error handler for the application
/// 
/// Provides consistent error handling and user feedback
class ErrorHandler {
  /// Handles errors and provides user-friendly messages
  /// 
  /// [error] - The error object
  /// [stackTrace] - The stack trace (optional)
  /// [context] - Optional context for the error
  /// [showSnackbar] - Whether to show a snackbar to the user (default: true)
  static void handleError(
    dynamic error,
    StackTrace? stackTrace, {
    String? context,
    bool showSnackbar = true,
  }) {
    // Log the error
    AppLogger.error(
      context != null ? 'Error in $context: $error' : 'Error: $error',
      error,
      stackTrace,
      'ErrorHandler',
    );

    // Show user-friendly message
    if (showSnackbar) {
      final message = _getUserFriendlyMessage(error);
      Get.snackbar(
        'خطأ',
        message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
      );
    }
  }

  /// Handles StatusRequest errors
  /// 
  /// [status] - The status request error
  /// [showSnackbar] - Whether to show a snackbar (default: true)
  static void handleStatusError(
    StatusRequest status, {
    bool showSnackbar = true,
  }) {
    final message = _getStatusMessage(status);
    
    AppLogger.warning('Status error: $status', 'ErrorHandler');

    if (showSnackbar) {
      Get.snackbar(
        'تنبيه',
        message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
      );
    }
  }

  /// Converts error to user-friendly Arabic message
  static String _getUserFriendlyMessage(dynamic error) {
    if (error is TimeoutException) {
      return 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.';
    } else if (error.toString().contains('SocketException') ||
        error.toString().contains('network')) {
      return 'مشكلة في الاتصال بالإنترنت. يرجى التحقق من الاتصال والمحاولة مرة أخرى.';
    } else if (error.toString().contains('FormatException') ||
        error.toString().contains('json')) {
      return 'خطأ في معالجة البيانات. يرجى المحاولة مرة أخرى.';
    } else {
      return 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
    }
  }

  /// Converts StatusRequest to user-friendly Arabic message
  static String _getStatusMessage(StatusRequest status) {
    switch (status) {
      case StatusRequest.loading:
        return 'جاري التحميل...';
      case StatusRequest.success:
        return 'تمت العملية بنجاح';
      case StatusRequest.failure:
        return 'فشلت العملية. يرجى المحاولة مرة أخرى.';
      case StatusRequest.noInternet:
        return 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الاتصال.';
      case StatusRequest.serverFailure:
        return 'خطأ في الخادم. يرجى المحاولة لاحقاً.';
      case StatusRequest.offlineFailure:
        return 'لا يمكن الاتصال بالخادم. يرجى التحقق من الاتصال.';
    }
  }

  /// Handles network errors specifically
  /// 
  /// [error] - The network error
  /// [retryCallback] - Optional callback to retry the operation
  static void handleNetworkError(
    dynamic error, {
    VoidCallback? retryCallback,
  }) {
    AppLogger.error('Network error: $error', error, null, 'ErrorHandler');

    Get.snackbar(
      'مشكلة في الاتصال',
      'لا يمكن الاتصال بالخادم. يرجى التحقق من الاتصال بالإنترنت.',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      mainButton: retryCallback != null
          ? TextButton(
              onPressed: retryCallback,
              child: const Text('إعادة المحاولة'),
            )
          : null,
    );
  }
}

