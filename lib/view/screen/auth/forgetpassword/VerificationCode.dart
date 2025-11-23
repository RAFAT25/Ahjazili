import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/Color.dart';
import '../../../../controller/VerificationCodeSignup_Controller.dart';
import '../../../../core/consta/images.dart';
import '../../../Widget/ConstomCheckForget/ConstomCheckForget.dart';


class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    // أسند الكنترولر مع تأكد أن فيه متغير errorMessage ودالة checkVerificationCodeFromUI
    final codeController = Get.put(VerificationCode_ControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('التحقق من الحساب', style: TextStyle(fontFamily: 'Cairo')),
        backgroundColor: AppColor.color_primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: ListView(
          children: [
            // صورة ورأس الصفحة
            ConstomCheckForget(
              nameimage: AppImage.image_forget,
              Text1: 'رمز التحقق',
              Text2: 'أدخل الكود المرسل لبريدك الإلكتروني أو هاتفك',
              Text3: '',
            ),
            SizedBox(height: 18),
            // حقل رمز التحقق بـ OtpTextField
            OtpTextField(
              numberOfFields: 5,
              borderWidth: 2,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(12),
              borderColor: AppColor.color_primary,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                codeController.checkVerificationCodeFromUI(verificationCode);
              },
            ),
            SizedBox(height: 20),
            // رسالة الخطأ
            Obx(() =>
            codeController.errorMessage.isNotEmpty
                ? Align(
              alignment: Alignment.center,
              child: Text(
                codeController.errorMessage.value,
                style: TextStyle(color: Colors.red, fontFamily: 'Cairo'),
              ),
            )
                : SizedBox.shrink()
            ),
            SizedBox(height: 20),
            // فقط اثناء التجربة (اعرض الكود المستلم من السيرفر)
            Obx(() =>
            codeController.verificationCodeFromServer.isNotEmpty
                ? Center(
              child: Text(
                "رمز التحقق (للتجربة): ${codeController.verificationCodeFromServer}",
                style: TextStyle(fontFamily: 'Cairo', color: Colors.grey, fontSize: 14),
              ),
            )
                : SizedBox.shrink()
            ),
          ],
        ),
      ),
    );
  }
}
