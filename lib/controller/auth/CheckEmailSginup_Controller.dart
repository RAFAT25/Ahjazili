
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/consta/nameRoute.dart';


abstract class CheckEmailSginup_Controller extends GetxController{

  CheckEmail();
  GoToVerificationCode();
}
class CheckEmailSginup_ControllerImp extends CheckEmailSginup_Controller{
  late TextEditingController Email;
  @override
  CheckEmail() {

  }

  @override
  GoToVerificationCode() {
    Get.toNamed(AppRoute.VerificationCodesginup);
    Get.delete();
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