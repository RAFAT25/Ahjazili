import 'dart:io';
import 'package:get/get.dart';
import 'dart:async';

/// Service for monitoring internet connectivity
/// 
/// Provides automatic periodic checks and reactive connectivity status
class InternetService extends GetxService {
  /// Observable boolean indicating if the device is connected to the internet
  final isConnected = true.obs;
  
  Timer? _timer;

  /// Checks if the device has an active internet connection
  Future<void> checkInternet() async {
    try {
      var result = await InternetAddress.lookup("google.com");
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected.value = false;
    }
  }

  /// Starts automatic periodic internet connectivity checks
  /// 
  /// [interval] - The duration between each check (default: 8 seconds)
  void startAutoCheck({Duration interval = const Duration(seconds: 8)}) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => checkInternet());
  }

  @override
  void onInit() {
    super.onInit();
    checkInternet();
    startAutoCheck();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

