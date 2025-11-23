import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/AuthService.dart';

void showLogoutDialog(BuildContext context) {
  Get.defaultDialog(
    title: "تأكيد تسجيل الخروج",
    middleText: "هل أنت متأكد أنك تريد تسجيل الخروج؟",
    confirm: ElevatedButton(
      onPressed: () async {
        await Get.find<AuthService>().logout(); // تنفيذ عملية تسجيل الخروج والنقل
      },
      child: Text("نعم"),
    ),
    cancel: TextButton(
      onPressed: () => Get.back(), // إغلاق الحوار فقط
      child: Text("إلغاء"),
    ),
  );
}
