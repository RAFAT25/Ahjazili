
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/Color.dart';


import '../../../../controller/auth/CheckEmail_Controller.dart';
import '../../../../core/Funaction/validatorInput.dart';
import '../../../../core/consta/images.dart';
import '../../../controller/auth/CheckEmailSginup_Controller.dart';
import '../../Widget/ConstomCheckForget/ConstomCheckForget.dart';
import '../../Widget/buildInputField.dart';
import '../../Widget/widget_Butoon.dart';


class CheckEmail extends StatelessWidget {

  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
 const borderRadius = 16.0;
 CheckEmailSginup_ControllerImp controller=Get.put(CheckEmailSginup_ControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("51".tr,style: TextStyle(color: AppColor.color_primary,fontSize: 20),),
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
                Text1: '51'.tr,Text2: '34'.tr,Text3: '35'.tr
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: buildInputField(
                      (value){
                    return  validatorInput(value!,'14'.tr,);
                  },
                  controller.Email, '9'.tr,
                  Icons.email, false, borderRadius),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WidegtBtuoon(backgroundColor: AppColor.color_primary,onPressed: () => controller.GoToVerificationCode(),text: "39".tr,),
            )

          ],
        ),
      ),
    );
  }
}
