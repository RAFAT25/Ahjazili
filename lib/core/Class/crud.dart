import 'package:travelsystem/core/Function/checkInternet.dart';
import 'package:travelsystem/core/Function/logger.dart';
import 'package:travelsystem/core/Services/cacheService.dart';
import 'package:http/http.dart' as http;
import 'StatusRequest.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'dart:async';

/// CRUD operations class for handling HTTP requests
/// 
/// Provides methods for POST, PUT, DELETE, and GET operations
/// with retry mechanism and caching support
class Crud {
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  static const Duration requestTimeout = Duration(seconds: 30);

  /// Performs a POST request to the specified URL with retry mechanism
  /// 
  /// [linkUrl] - The URL to send the request to
  /// [data] - The data to send in the request body
  /// [useCache] - Whether to use cache for this request (default: false)
  /// [cacheKey] - Optional cache key (default: uses linkUrl)
  /// 
  /// Returns [Either] containing [StatusRequest] on failure or [List] on success
  Future<Either<StatusRequest, List>> postMethod(
    String linkUrl,
    Map<String, dynamic> data, {
    bool useCache = false,
    String? cacheKey,
  }) async {
    // Check cache first if enabled
    if (useCache) {
      final key = cacheKey ?? linkUrl;
      final cached = CacheService.get(key);
      if (cached != null) {
        AppLogger.debug('Returning cached data for: $key', 'Crud');
        return Right(cached as List);
      }
    }

    // Check internet connection
    if (!await checkInternet()) {
      return const Left(StatusRequest.offlineFailure);
    }

    // Retry mechanism
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        AppLogger.debug('Attempt $attempt/$maxRetries for: $linkUrl', 'Crud');
        
        var response = await http.post(
          Uri.parse(linkUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(data),
        ).timeout(
          requestTimeout,
          onTimeout: () {
            throw TimeoutException('Request timeout after ${requestTimeout.inSeconds}s');
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          List responseData = json.decode(response.body);
          
          // Cache the response if enabled
          if (useCache) {
            final key = cacheKey ?? linkUrl;
            CacheService.set(key, responseData);
            AppLogger.debug('Cached response for: $key', 'Crud');
          }
          
          AppLogger.success('Request successful: $linkUrl', 'Crud');
          return Right(responseData);
        } else {
          AppLogger.warning(
            'Request failed with status ${response.statusCode}: $linkUrl',
            'Crud',
          );
          if (attempt < maxRetries) {
            await Future.delayed(retryDelay * attempt);
            continue;
          }
          return Left(StatusRequest.serverFailure);
        }
      } on TimeoutException catch (e) {
        AppLogger.warning('Timeout on attempt $attempt: ${e.message}', 'Crud');
        if (attempt < maxRetries) {
          await Future.delayed(retryDelay * attempt);
          continue;
        }
        return const Left(StatusRequest.serverFailure);
      } catch (e, stackTrace) {
        AppLogger.error(
          'Error on attempt $attempt: $e',
          e,
          stackTrace,
          'Crud',
        );
        if (attempt < maxRetries) {
          await Future.delayed(retryDelay * attempt);
          continue;
        }
        return const Left(StatusRequest.offlineFailure);
      }
    }

    return const Left(StatusRequest.offlineFailure);
  }

  /// Performs a PUT request (to be implemented)
  Future<void> putMethod() async {
    // TODO: Implement PUT method
  }

  /// Performs a DELETE request (to be implemented)
  Future<void> deleteMethod() async {
    // TODO: Implement DELETE method
  }

  /// Performs a GET request (to be implemented)
  Future<void> getMethod() async {
    // TODO: Implement GET method
  }
}

