
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/consta/nameRoute.dart';


abstract class CheckEmail_Controller extends GetxController{

  CheckEmail();
  GoToVerificationCode();
}
class CheckEmail_ControllerImp extends CheckEmail_Controller{
  late TextEditingController Email;
  @override
  CheckEmail() {

  }

  @override
  GoToVerificationCode() {
    Get.toNamed(AppRoute.ResetPassword);
    Get.delete<CheckEmail_Controller>();
  }
  @override
  void onInit() {
    Email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    Email.dispose();
    super.dispose();
  }
}