import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/consta/nameRoute.dart';

abstract class VerificationCode_Controller extends GetxController {
  void checkVerificationCodeFromUI(String code);
  void goToHomePage();
}

class VerificationCode_ControllerImp extends VerificationCode_Controller {
  late String email;
  final verificationCodeFromServer = ''.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    email = Get.arguments['email'] ?? '';
    verificationCodeFromServer.value = Get.arguments['verification_code']?.toString() ?? '';
    super.onInit();
  }

  @override
  void checkVerificationCodeFromUI(String code) async {
    errorMessage.value = '';
    if (code.trim().isEmpty) {
      errorMessage.value = 'يرجى إدخال رمز التحقق.';
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8012/TravelSystem/verify_code.php"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "code": code.trim(),
        }),
      );

      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        goToHomePage();
      } else {
        errorMessage.value = data['error'] ?? 'رمز التحقق غير صحيح!';
      }
    } catch (e) {
      errorMessage.value = 'خطأ أثناء التحقق أو الاتصال: $e';
    }
  }

  @override
  void goToHomePage() {
    Get.offAllNamed(AppRoute.Login);
    Get.delete<VerificationCode_ControllerImp>();

  }
}
