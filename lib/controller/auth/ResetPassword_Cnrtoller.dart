
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/consta/nameRoute.dart';

abstract class ResetPassword_Cnrtoller extends GetxController{

  ForgotPassword();
  GoToSucces();
}
class ResetPassword_CnrtollerImp extends ResetPassword_Cnrtoller{
  late TextEditingController Password;
  late TextEditingController RebPassword;
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  late GlobalKey<FormState> formKey;
  final errorMessage = ''.obs;
  @override
  ForgotPassword() {

    if (formKey.currentState!.validate()){
           if(Password.text==RebPassword.text){
             GoToSucces();
           }
           if(Password.text!=RebPassword.text){
             errorMessage.value = '26'.tr;
             return;
           }
    }

  }
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  @override
  GoToSucces() {
    Get.offAndToNamed(AppRoute.Login);
    Get.delete();
  }
  @override
  void onInit() {
    Password=TextEditingController();
    RebPassword=TextEditingController();
    formKey=GlobalKey<FormState>();
    super.onInit();
  }
  @override
  void dispose() {
    Password.dispose();
    RebPassword.dispose();

    super.dispose();
  }
}