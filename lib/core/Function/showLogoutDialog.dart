import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/AuthService.dart';

/// Shows a dialog to confirm logout
/// 
/// [context] - The build context
void showLogoutDialog(BuildContext context) {
  Get.defaultDialog(
    title: "تأكيد تسجيل الخروج",
    middleText: "هل أنت متأكد أنك تريد تسجيل الخروج؟",
    confirm: ElevatedButton(
      onPressed: () async {
        await Get.find<AuthService>().logout();
      },
      child: const Text("نعم"),
    ),
    cancel: TextButton(
      onPressed: () => Get.back(),
      child: const Text("إلغاء"),
    ),
  );
}

