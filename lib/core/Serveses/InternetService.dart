import 'dart:io';
import 'package:get/get.dart';
import 'dart:async';

class InternetService extends GetxService {
  final isConnected = true.obs;
  Timer? _timer;

  Future<void> checkInternet() async {
    try {
      var result = await InternetAddress.lookup("google.com");
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected.value = false;
    }
  }

  // راقب الاتصال بالتكرار كل فترة
  void startAutoCheck({Duration interval = const Duration(seconds: 8)}) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => checkInternet());
  }

  @override
  void onInit() {
    checkInternet();
    startAutoCheck(); // يبدأ تلقائياً متكرر
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
