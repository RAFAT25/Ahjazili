import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../controller/auth/Sginup_controller.dart';
import '../../../core/Funaction/validatorInput.dart';
import '../../../core/consta/Color.dart';
import '../../Widget/buildInputField.dart';
import 'package:travelsystem/core/consta/images.dart';

class Sginup extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  static const String maleKey = "M";
  static const String femaleKey = "F";

  @override
  Widget build(BuildContext context) {
    const borderRadius = 16.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // شعار أعلى الصفحة مثل صفحة تسجيل الدخول
                  Container(
                    margin: const EdgeInsets.all(16),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImage.image_logo),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  SizedBox(height: 30),

                  Text('29'.tr,
                      style: TextStyle(
                          color: AppColor.color_primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: 'Cairo')),
                  SizedBox(height: 22),

                  buildInputField(
                        (value) => validatorInput(value!, '22'.tr),
                    controller.fullNameController,
                    '30'.tr,
                    Icons.person,
                    false,
                    borderRadius,
                  ),
                  SizedBox(height: 16),

                  // اختيار الجنس
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '31'.tr,
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                    ),
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Radio<Gender>(
                            activeColor: AppColor.color_primary,
                            value: Gender.male,
                            groupValue: controller.gender.value,
                            onChanged: (val) => controller.gender.value = val!,
                          ),
                          Text('27'.tr, style: TextStyle(fontFamily: 'Cairo')), // ذكر
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<Gender>(
                            activeColor: AppColor.color_primary,
                            value: Gender.female,
                            groupValue: controller.gender.value,
                            onChanged: (val) => controller.gender.value = val!,
                          ),
                          Text('28'.tr, style: TextStyle(fontFamily: 'Cairo')), // أنثى
                        ],
                      ),
                    ],
                  )),

                  SizedBox(height: 16),

                  buildInputField(
                        (value) => validatorInput(value!, '16'.tr),
                    controller.emailController,
                    '9'.tr,
                    Icons.email,
                    false,
                    borderRadius,
                  ),
                  SizedBox(height: 16),

                  Column(
                    children: [
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: '49'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        ),
                        initialCountryCode: 'YE',
                        onChanged: (phone) {
                          controller.phoneNumber.value = phone.number;
                          controller.countryISOCode.value = phone.countryISOCode;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Obx(() => buildInputField(
                        (value) => validatorInput(value!, '18'.tr),
                    controller.passwordController,
                    '10'.tr,
                    Icons.lock,
                    controller.obscurePassword.value,
                    borderRadius,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  )),
                  SizedBox(height: 16),
                  Obx(() => buildInputField(
                        (value) => validatorInput(value!, '15'.tr),
                    controller.confirmPasswordController,
                    '32'.tr,
                    Icons.lock_outline,
                    controller.obscureConfirmPassword.value,
                    borderRadius,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureConfirmPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  )),
                  SizedBox(height: 20),

                  // رسالة الخطأ
                  Obx(() => controller.errorMessage.isNotEmpty
                      ? Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red, fontSize: 13, fontFamily: 'Cairo'),
                    ),
                  )
                      : SizedBox.shrink()
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.color_primary,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),
                      onPressed: controller.register,
                      child: Text(
                        '29'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
