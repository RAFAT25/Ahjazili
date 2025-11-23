// file: view/screen/auth/login.dart (أو المسار الذي تستخدمه)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';


// 2. استيراد الـ Widgets المخصصة
import '../../../controller/auth/AuthService.dart';
import '../../../controller/auth/login_controlle.dart';
import '../../../core/Funaction/funaction_language.dart';
import '../../Widget/buildInputField.dart';
import '../../Widget/widget_Butoon.dart';

// 3. استيراد الثوابت والوظائف المساعدة
import '../../../core/Funaction/AlertExiteApp.dart';
import '../../../core/consta/Color.dart';
import '../../../core/consta/images.dart';
import '../../../core/consta/nameRoute.dart';
import '../../../core/localization/Changelocal.dart';

class Login extends StatelessWidget {

  final LoginController controller = Get.find<LoginController>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 16.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () => AlertExiteApp(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.language, color: AppColor.color_primary, size: 28),
                        onPressed: ()=>openLangSheet(),
                        tooltip: 'Change Language',
                      ),
                    ),
                     Container(
                       width: 250,
                       height: 80,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: AssetImage(AppImage.image_logo,),fit:BoxFit.cover ,)
                       ),
                     ),
                    SizedBox(height: 10,),

                    Text('7'.tr, style:  TextStyle(color: AppColor.color_primary, fontWeight: FontWeight.bold, fontSize: 28, fontFamily: 'Cairo')),
                    const SizedBox(height: 18),

                    Obx(() => Row(
                      children: [
                        _buildLoginTypeTab('8'.tr, controller.isPhoneLogin.value, () => controller.toggleLoginType(true), borderRadius),
                        const SizedBox(width: 10),
                        _buildLoginTypeTab('9'.tr, !controller.isPhoneLogin.value, () => controller.toggleLoginType(false), borderRadius),
                      ],
                    )),
                    const SizedBox(height: 25),

                    Obx(() => controller.isPhoneLogin.value
                    // --- حقل الهاتف ---
                        ? IntlPhoneField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        labelText: '49'.tr,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
                      ),
                      initialCountryCode: 'YE',
                      onChanged: (phone) => controller.countryISOCode.value = phone.countryISOCode,
                      validator:(PhoneNumber? phone) {

                        return controller.validatePhone(phone?.number);
              },
                    )
                    // --- حقل البريد الإلكتروني (باستخدام الـ Widget الخاص بك) ---
                        : buildInputField(
                      controller.validateEmail,
                      controller.emailController,
                      '9'.tr,
                      Icons.email_outlined,
                      false,
                      borderRadius,
                    )),
                    const SizedBox(height: 18),

                    // --- حقل كلمة المرور (باستخدام الـ Widget الخاص بك) ---
                    Obx(() => buildInputField(
                      controller.validatePassword,
                      controller.passwordController,
                      '10'.tr,
                      Icons.lock_outline,
                      controller.obscurePassword.value,
                      borderRadius,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: AppColor.color_primary,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    )),
                    const SizedBox(height: 12),

                    // --- رابط "نسيت كلمة المرور" ---
                    GestureDetector(
                      onTap: controller.goToForgotPassword,
                      child:  Align(
                          alignment: Alignment.centerRight,
                          child: Text('11'.tr, style: TextStyle(fontFamily: 'Cairo', color: AppColor.color_primary, fontWeight: FontWeight.w800))),
                    ),
                    const SizedBox(height: 28),

                    // --- زر تسجيل الدخول الرئيسي (مع مؤشر التحميل) ---
                    Obx(() {
                      final isLoading = controller.authStatus.value == UserStatus.loading;
                      return WidegtBtuoon(
                        text: "12".tr,
                        onPressed: isLoading ? null : controller.login,
                        backgroundColor: AppColor.color_primary,
                        child: isLoading
                            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
                            : Text('12'.tr, style: const TextStyle(color: Colors.white, fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.bold)),
                      );
                    }),
                    const SizedBox(height: 14),
                    // --- زر الدخول كزائر ---
                    WidegtBtuoon(
                      onPressed: () => Get.offAllNamed(AppRoute.MainController),
                      backgroundColor: Colors.black87,
                      text: '13'.tr,
                    ),
                    const SizedBox(height: 20),

                    // --- رابط إنشاء حساب جديد ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('14'.tr, style: const TextStyle(fontFamily: 'Cairo')),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: controller.goToSignUp,
                          child: Text('15'
                              ''.tr,
                              style:  TextStyle(color: AppColor.color_primary, decoration: TextDecoration.underline, fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Widget مساعد لبناء أزرار التبديل (الجوال/البريد)
  Widget _buildLoginTypeTab(String text, bool isSelected, VoidCallback onTap, double borderRadius) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.color_primary : Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: isSelected ? AppColor.color_primary : Colors.grey.shade300, width: 1.5),
            boxShadow: isSelected
                ? [BoxShadow(color: AppColor.color_primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
                : [],
          ),
          child: Text(
            text.tr,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
