import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';
import 'package:http/http.dart' as http;

enum Gender { male, female, none }

class RegisterController extends GetxController {
  // --- المدخلات
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumber = ''.obs;

  // --- الحالة
  final countryISOCode = 'YE'.obs;
  final gender = Gender.none.obs;
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final errorMessage = ''.obs;
  late GlobalKey<FormState> formKey;

  // --- التحقق من صحة المدخلات ---
  bool validateForm() {
    errorMessage.value = '';
    if (fullNameController.text.trim().isEmpty) {
      errorMessage.value = 'يرجى إدخال الاسم الكامل';
      return false;
    }
    if (phoneNumber.value.trim().isEmpty) {
      errorMessage.value = 'يرجى إدخال رقم الهاتف';
      return false;
    }
    // تحقق من صحة الرقم حسب الدولة:
    if (!validatePhone(phoneNumber.value)) return false;

    if (emailController.text.trim().isEmpty) {
      errorMessage.value = 'يرجى إدخال البريد الإلكتروني';
      return false;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      errorMessage.value = 'البريد الإلكتروني غير صحيح';
      return false;
    }
    if (passwordController.text.length < 6) {
      errorMessage.value = 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      errorMessage.value = 'كلمة المرور غير متطابقة';
      return false;
    }
    if (gender.value == Gender.none) {
      errorMessage.value = 'يرجى اختيار الجنس';
      return false;
    }
    return true;
  }

  bool validatePhone(String number) {
    if (countryISOCode.value == 'YE' &&
        !(number.startsWith('71') ||
            number.startsWith('73') ||
            number.startsWith('77') ||
            number.startsWith('78'))) {
      errorMessage.value = 'رقم اليمن يجب أن يبدأ بـ: 71، 73، 77 أو 78';
      return false;
    }
    if (countryISOCode.value == 'SA' && !number.startsWith('50')) {
      errorMessage.value = 'رقم السعودية يجب أن يبدأ بـ: 50';
      return false;
    }
    return true;
  }


  Future<void> register() async {
    if (!validateForm()) return;

    String genderValue = gender.value == Gender.male
        ? "M"
        : gender.value == Gender.female
        ? "F"
        : "";

    errorMessage.value = '';
    final Map<String, dynamic> valueData = {
      "full_name": fullNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
      "phone_number": phoneNumber.value,
      "user_type": "Customer"
    };
    final String jsonData = json.encode(valueData);
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8012/TravelSystem/register_user.php"),
      body: jsonData,
    );

    final data = json.decode(response.body);
    if (data['success'] == true) {

      Get.offAllNamed(
        AppRoute.VerificationCodesginup,
        arguments: {
          "email": emailController.text.trim(),
          "verification_code": data['verification_code'],
        },
      );
      Get.delete<RegisterController>();
    } else {
      errorMessage.value = data['error'] ?? 'حدث خطأ أثناء التسجيل';
      Get.snackbar(
        '20'.tr,
        '21'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
      );
    }
  }

  void togglePasswordVisibility() =>
      obscurePassword.value = !obscurePassword.value;

  void toggleConfirmPasswordVisibility() =>
      obscureConfirmPassword.value = !obscureConfirmPassword.value;

  void goToLogin() {
    Get.offAllNamed(AppRoute.VerificationCode);
    Get.delete<RegisterController>();
  }

  // إعادة تعيين النموذج بعد استخدامه
  void clearForm() {
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneNumber.value = '';
    gender.value = Gender.none;
    errorMessage.value = '';
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
