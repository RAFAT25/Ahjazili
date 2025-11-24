import 'package:get/get.dart';
import 'package:travelsystem/core/Class/crud.dart';

/// Initial binding for dependency injection
/// 
/// Registers core services and repositories that are needed throughout the app
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
