/// Validates input field value
/// 
/// [value] - The input value to validate
/// [message] - The error message to return if validation fails
/// 
/// Returns error message if validation fails, null otherwise
String? validatorInput(String? value, String message) {
  if (value == null || value.isEmpty) {
    return message;
  } else {
    return null;
  }
}

