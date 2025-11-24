/// Enum representing the status of a network request
/// 
/// Used to track the state of API calls and network operations
enum StatusRequest {
  /// Request is currently loading
  loading,
  
  /// Request completed successfully
  success,
  
  /// Request failed with a general error
  failure,
  
  /// No internet connection available
  noInternet,
  
  /// Server error occurred (5xx status codes)
  serverFailure,
  
  /// Offline failure - network unavailable
  offlineFailure,
}