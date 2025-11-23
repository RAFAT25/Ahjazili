import 'package:get/get.dart';
import 'package:travelsystem/core/Class/crud.php.dart';

class initialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }

}