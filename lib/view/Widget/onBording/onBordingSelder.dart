
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/OnboardingControler.dart';
import '../../../model/Datasource/static/DataonBorading.dart';

class onBordingSelder extends GetView<OnboardingController> {
  const onBordingSelder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 4,
      child: PageView.builder(
         controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: Data_onBorading.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(Data_onBorading[index].image!),
              ),
              Text(Data_onBorading[index].titel!,textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold)
                ,),
              SizedBox(height: 15,),
              Text(Data_onBorading[index].descrption!,textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,)
            ],
          );
        },
      ),
    );
  }
}
