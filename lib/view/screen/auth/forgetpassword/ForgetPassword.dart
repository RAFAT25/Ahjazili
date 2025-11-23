
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/Color.dart';
import '../../../../controller/auth/CheckEmail_Controller.dart';
import '../../../../core/Funaction/validatorInput.dart';
import '../../../../core/consta/images.dart';
import '../../../Widget/ConstomCheckForget/ConstomCheckForget.dart';
import '../../../Widget/buildInputField.dart';
import '../../../Widget/widget_Butoon.dart';

class ForgetPassword extends StatelessWidget {

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
 const borderRadius = 16.0;
    CheckEmail_ControllerImp controller=Get.put(CheckEmail_ControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("33".tr,style: TextStyle(color: AppColor.color_primary,fontSize: 20),),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded,color: AppColor.color_primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstomCheckForget(nameimage: AppImage.image_forget,
                Text1: '33'.tr,Text2: 'Enter your registered email below to receive',Text3: 'password reset instuction'
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: buildInputField(
                      (value){
                    return  validatorInput(value!,'16'.tr,);
                  },
                  controller.Email, '9'.tr,
                  Icons.email, false, borderRadius),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WidegtBtuoon(backgroundColor: AppColor.color_primary,onPressed: () => controller.GoToVerificationCode(),text: "27".tr,),
            )

          ],
        ),
      ),
    );
  }
}
