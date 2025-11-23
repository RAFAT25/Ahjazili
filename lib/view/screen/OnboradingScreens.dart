import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/OnboardingControler.dart';

import '../Widget/onBording/NextButton.dart';
import '../Widget/onBording/onBordingControler.dart';
import '../Widget/onBording/onBordingSelder.dart';


class onBording extends StatelessWidget {
  const onBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            onBordingSelder(),
            onBordingControler(),
            NextButton(),
          ],
        ),
      ) ,
    );
  }
}


