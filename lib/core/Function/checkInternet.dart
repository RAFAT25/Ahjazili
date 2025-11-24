import 'dart:io';

/// Checks if the device has an active internet connection
/// 
/// Returns `true` if internet is available, `false` otherwise
Future<bool> checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

