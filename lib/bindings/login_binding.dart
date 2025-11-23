import 'package:get/get.dart';


import '../controller/auth/login_controlle.dart'; // تأكد من المسار الصحيح

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // استخدم Get.lazyPut لإنشاء الـ Controller فقط عند الحاجة إليه
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
