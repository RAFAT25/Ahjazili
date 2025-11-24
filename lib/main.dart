import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travelsystem/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'bindings/initialBinding.dart';
import 'controller/auth/AuthService.dart';
import 'core/Function/NetworkController.dart';
import 'core/Services/internetService.dart';
import 'core/localization/Changelocal.dart';
import 'core/localization/transiletion.dart';
import 'view/screen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  Get.put(NetworkController());
  await GetStorage.init();
  Get.put(InternetService(), permanent: true);

  await Get.putAsync(() async => AuthService());
  Get.put(LocaleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.find();
    return GetMaterialApp(
      getPages: getPages,
      locale: localeController.appLocale.value,
      fallbackLocale: const Locale('ar'),
      translations: Mytranlaztion(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: InitialBinding(),
    );
  }
}
