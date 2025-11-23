import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:travelsystem/core/consta/images.dart';
import 'package:travelsystem/view/Widget/CostamTextFilde.dart';

import '../../core/consta/Color.dart';
import '../Widget/NextButton.dart';

class page_Login extends StatefulWidget {
  const page_Login({super.key});

  @override
  State<page_Login> createState() => _page_LoginState();
}

class _page_LoginState extends State<page_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Image.asset(AppImage.image_logo, width: 300, height: 250),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              alignment: Alignment.topRight,
                child: const Text(
              "   البريد الاكتروني أو رقم الهاتف",
              style: TextStyle(
                fontSize: 20,
              ),
            )),
            CostamTextFilde(
              prefixIcon: Icons.email,
              hintText: "يجب ادخال الايميل الخاص بك",
              validator: (p0) {},
              statusinput: false,
              TypeText: TextInputType.emailAddress,
            ),
            Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.topRight,
                child: const Text(
                  "كلمه المرور",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
            CostamTextFilde(
              prefixIcon: Icons.password,
              hintText: "يجب ادخال كلمه المرور الخاص بك",
              validator: (p0) {},
              statusinput: true,
              TypeText: TextInputType.emailAddress,
            ),
            NextButtont(600,
                onPressed: () {

                },
                backgroundColor: AppColor.color_primary,
                colortext: AppColor.color_secondary,
                text: " انشاء حساب"),
            Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.topRight,
                child: Text(
                  " نسيت كلمه المرور",
                  style: TextStyle(
                    color: AppColor.color_primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                )),
                 const SizedBox(height: 80,),
               Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                         margin: const EdgeInsets.only(right: 10),
                         alignment: Alignment.topRight,
                         child: InkWell(
                           onTap: () {

                           },
                           child: Text(
                             " إنشاء حساب جديد",
                             style: TextStyle(
                               color: AppColor.color_primary,
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                             ),
                           ),
                         )),
                     Container(
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.topRight,
                        child: const Text(
                          " ليس لدي حساب؟",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),

                   ],
                 ),
               )

          ],
        ),
      ),
    );
  }
}
