import 'package:get/get.dart';
import 'package:travelsystem/controller/main_view_model.dart'; // تأكد من المسار الصحيح

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // استخدم Get.lazyPut لإنشاء الـ ViewModel فقط عند فتح الصفحة الرئيسية
    Get.lazyPut<MainViewModel>(() => MainViewModel());
  }
}
