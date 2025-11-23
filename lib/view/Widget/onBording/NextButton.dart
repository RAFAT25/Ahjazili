import 'package:get/get.dart';

import '../../../controller/OnboardingControler.dart';

import 'package:flutter/material.dart';

import '../../../core/consta/Color.dart';
class NextButton extends GetView<OnboardingController> {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        width: 400,
        child: FilledButton(
            onPressed: (){
              controller.next();
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_in(),));
            },
            style:  ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
              backgroundColor: MaterialStatePropertyAll(AppColor.color_primary),
            ),
            child: Text("4".tr,style: TextStyle(fontSize: 18),)
        ),
      ),
    );

  }
}