
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/Color.dart';

import '../../../../controller/auth//ResetPassword_Cnrtoller.dart';
import '../../../../core/Funaction/validatorInput.dart';
import '../../../../core/consta/images.dart';
import '../../../Widget/ConstomCheckForget/ConstomCheckForget.dart';
import '../../../Widget/buildInputField.dart';
import '../../../Widget/widget_Butoon.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPassword_CnrtollerImp conrtoller=Get.put(ResetPassword_CnrtollerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded,color: AppColor.color_primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: conrtoller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ConstomCheckForget(nameimage: AppImage.image_forget,
                    Text1: '36'.tr,Text2: '37'.tr,Text3: '35'.tr
                ),
                 SizedBox(height: 10,),
                Obx(() => buildInputField(
                      (value){
                    return  validatorInput(value!,'18'.tr,);
                  },
                  conrtoller.Password,
                  '10'.tr,
                  Icons.lock,
                  conrtoller.obscurePassword.value,
                  AppStyel.borderRadius,
                  suffixIcon: IconButton(
                    icon: Icon(
                        conrtoller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey),
                    onPressed: conrtoller.togglePasswordVisibility,
                  ),
                )),
                SizedBox(height: 16),
                Obx(() => buildInputField(
                      (value){
                    return  validatorInput(value!,"26".tr,);
                  },
                  conrtoller.RebPassword,
                  '32'.tr,
                  Icons.lock_outline,
                  conrtoller.obscureConfirmPassword.value,
                  AppStyel.borderRadius,
                  suffixIcon: IconButton(
                    icon: Icon(
                        conrtoller.obscureConfirmPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey),
                    onPressed: conrtoller.toggleConfirmPasswordVisibility,
                  ),
                )),
                SizedBox(height: 10,),
                Obx(() => conrtoller.errorMessage.isNotEmpty
                    ? Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    conrtoller.errorMessage.value,
                    style: TextStyle(color: Colors.red, fontSize: 13, fontFamily: 'Cairo'),
                  ),
                )
                    : SizedBox.shrink()),
                WidegtBtuoon(onPressed: (){
                  conrtoller.ForgotPassword();
                //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login_in(),));
                }, text:  '38'.tr,
                backgroundColor: AppColor.color_primary,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


