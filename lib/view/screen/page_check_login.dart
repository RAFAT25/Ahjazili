import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:travelsystem/core/consta/Color.dart';
import 'package:travelsystem/view/Widget/NextButton.dart';
import 'package:travelsystem/view/screen/page_Login.dart';

import '../../core/consta/images.dart';
import 'auth/login.dart';

class page_check_login extends StatelessWidget {
  const page_check_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Image.asset(AppImage.image_logo, width: 300, height: 300),
              ),
            ),
            NextButtont(400,onPressed: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
             }, backgroundColor: AppColor.color_primary, colortext: AppColor.color_secondary, text: "تسجيل الدخول"),
            NextButtont(400,onPressed: (){}, backgroundColor: AppColor.color_secondary, colortext: AppColor.color_primary, text: " انشاء حساب"),
          ],
        ),
      ),
    );
  }
}
