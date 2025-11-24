// file: lib/middleware/route_middleware.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';

import '../../controller/auth/AuthService.dart';
import '../Function/logger.dart';

class RouteMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;

  final AuthService authService = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final bool seenOnboarding = authService.hasSeenOnboarding();
    final bool isLoggedIn = authService.isAuthenticated;

    AppLogger.debug("Checking route '$route'. Seen Onboarding: $seenOnboarding, Is Logged In: $isLoggedIn", "RouteMiddleware");

    // --- القاعدة رقم 1: التعامل مع Onboarding ---
    // إذا لم ير المستخدم Onboarding، يجب أن يذهب إليها أولاً وقبل كل شيء.
    if (!seenOnboarding) {
      // اسمح له بالوصول فقط إذا كان المسار هو Onboarding نفسه.
      // إذا حاول الذهاب لأي مكان آخر، أعد توجيهه إلى Onboarding.
      return route == AppRoute.onBording
          ? null // المسار صحيح، لا تفعل شيئًا
          : RouteSettings(name: AppRoute.onBording); // المسار خاطئ، أجبِره على Onboarding
    }

    // --- من هذه النقطة فصاعدًا، نحن متأكدون 100% أن المستخدم قد رأى Onboarding ---

    // --- القاعدة رقم 2: التعامل مع المستخدم المسجل ---
    if (isLoggedIn) {
      // إذا كان المستخدم مسجلاً ويحاول الذهاب إلى صفحات المصادقة (Login/Onboarding)،
      // فهذا خطأ. أعد توجيهه إلى الصفحة الرئيسية.
      if (route == AppRoute.Login || route == AppRoute.onBording) {
        return RouteSettings(name: AppRoute.MainController);
      }
    }
    // --- القاعدة رقم 3: التعامل مع الضيف (الذي رأى Onboarding) ---
    else { // (isLoggedIn is false)
      // إذا كان المستخدم ضيفًا ويحاول الذهاب إلى أي صفحة غير صفحة تسجيل الدخول،
      // فهذا خطأ. أعد توجيهه إلى صفحة تسجيل الدخول.
      // هذا يضمن أن الضيف لا يمكنه الوصول إلى الصفحة الرئيسية أو أي صفحات داخلية أخرى.
      if (route != AppRoute.Login) {
        return RouteSettings(name: AppRoute.Login);
      }
    }

    // إذا وصل الكود إلى هنا، فهذا يعني أن المستخدم في المسار الصحيح
    // (مثال: مستخدم مسجل يذهب إلى الرئيسية، أو ضيف يذهب إلى صفحة الدخول).
    // `return null` يعني "اسمح بالمرور".
    return null;
  }
}
