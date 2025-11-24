import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

/// Controller for managing network connectivity status
/// 
/// Monitors network state and provides real-time connectivity updates
class NetworkController extends GetxController {
  /// Observable boolean indicating if the device is online
  var isOnline = true.obs;

  /// Checks if the device has an active internet connection
  /// 
  /// Returns `true` if internet is available, `false` otherwise
  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        isOnline.value = false;
      } else {
        isOnline.value = await checkInternet();
      }
    });

    // Initial check when the app starts
    Future.delayed(Duration.zero, () async {
      isOnline.value = await checkInternet();
    });
  }
}

