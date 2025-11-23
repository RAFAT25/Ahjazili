
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/OnboardingControler.dart';
import '../../../core/consta/Color.dart';
import '../../../model/Datasource/static/DataonBorading.dart';

class onBordingControler extends StatelessWidget {
  const onBordingControler({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) =>
        Expanded(
        flex: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(Data_onBorading.length,
                    (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: 5),
                  width: controller.currentPage==index?20 :10 ,
                  height: 10,
                  decoration: BoxDecoration(
                      color: AppColor.color_primary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                )
            )
          ],
        )
    ),);
  }
}
