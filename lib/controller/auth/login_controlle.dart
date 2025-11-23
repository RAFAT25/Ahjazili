// file: controllers/login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';

import 'AuthService.dart'; // تأكد من أن المسار صحيح

class LoginController extends GetxController {
  // --- Dependencies ---
  final AuthService _authService = Get.find();

  // --- State Management ---
  // استخدام Rx<UserStatus> من AuthService مباشرة لإدارة حالة التحميل
  // هذا يضمن أن الحالة متزامنة في كل التطبيق
  Rx<UserStatus> get authStatus => _authService.userStatus;

  final obscurePassword = true.obs;
  final isPhoneLogin = true.obs;

  // --- Form Management ---
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  // --- Phone Input Specific State ---
  final countryISOCode = 'YE'.obs;

  // ================== Lifecycle Methods ==================
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  // ================== UI Logic Methods ==================

  void toggleLoginType(bool isPhone) {
    if (authStatus.value == UserStatus.loading) return;
    isPhoneLogin.value = isPhone;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  // ================== Validation Methods ==================

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return '16'.tr;
    if (!GetUtils.isEmail(value)) return '17'.tr;
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return '18'.tr;
    /*if (value.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';*/
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return '19'.tr;
    if (countryISOCode.value == 'YE') {
      if (!RegExp(r'^(71|73|77|78)\d{7}$').hasMatch(value)) {
        return 'رقم يمني غير صالح (9 أرقام)';
      }
    } else if (countryISOCode.value == 'SA') {
      if (!RegExp(r'^5\d{8}$').hasMatch(value)) {
        return 'رقم سعودي غير صالح (9 أرقام)';
      }
    }
    return null;
  }

  // ================== Core Logic & Navigation ==================


  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    if (authStatus.value == UserStatus.loading) return;
     print('rafat');
    final identifier = emailController.text;
    print(identifier);
    final pwd = passwordController.text;
    print(pwd);
    final result = await _authService.login(identifier, pwd);
    print("llll");
    if (result != null) {
      print("123");
      // تسجيل الدخول ناجح، يمكن استخدام result['user_name'], result['user_id']
      Get.offAllNamed(
          AppRoute.MainController); // أو المسار الذي تريد النقل إليه بعد تسجيل الدخول
      Get.snackbar(
        'أهلاً',
        'مرحباً ${result['user_name']} (ID: ${result['user_id']})',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.9),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        '20'.tr,
        '21'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
      );
    }
  }


  void goToSignUp() {
    Get.toNamed(AppRoute.SingUp);
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoute.CheckEmail);
  }
}
