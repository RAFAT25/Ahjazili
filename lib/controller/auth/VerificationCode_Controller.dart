
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/consta/nameRoute.dart';



abstract class VerificationCode_Controller extends GetxController{

  CheckVerificationCode();
  GoToResetPassword();
}
class VerificationCode_ControllerImp extends VerificationCode_Controller{
late String verificationCode;
  @override
  CheckVerificationCode() {

  }
  @override
  GoToResetPassword() {
    Get.offAndToNamed(AppRoute.ResetPassword);
    Get.delete();
  }
  @override
  void onInit() {

    super.onInit();
  }

}