import '../Class/StatusRequest.dart';

/// Handles the response data and returns the appropriate status
/// 
/// [response] - The response from the API call
/// 
/// Returns [StatusRequest] indicating the status of the response
StatusRequest handlingData(dynamic response) {
  if (response is StatusRequest) {
    // Response is already a status code (error or other)
    return response;
  } else if (response == null) {
    // No data available
    return StatusRequest.failure;
  } else {
    // Data is available and valid
    return StatusRequest.success;
  }
}

