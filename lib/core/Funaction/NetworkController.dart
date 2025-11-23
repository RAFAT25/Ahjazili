import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class NetworkController extends GetxController {
  var isOnline = true.obs;

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

    // فحص أولي عند تشغيل التطبيق
    Future.delayed(Duration.zero, () async {
      isOnline.value = await checkInternet();
    });
  }
}
