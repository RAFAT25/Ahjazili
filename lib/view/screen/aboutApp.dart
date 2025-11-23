import 'package:flutter/material.dart';
import 'package:travelsystem/core/consta/images.dart';

import '../../core/consta/Color.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عن التطبيق"),
        backgroundColor: AppColor.color_primary2,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
            child: Container(
              width: 400,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          height: 100,
                          decoration:  BoxDecoration(
                              color:  AppColor.color_primary2,
                              shape: BoxShape.circle,
                            image:DecorationImage(image: AssetImage(AppImage.image_logo)),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(" تطبيق حجز الرحلات الأول في اليمن",style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontWeight: FontWeight.w800,fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    height: 30,
                      width: 100,
                      child: Text("الاصدار 1.0.0",style: TextStyle(color: AppColor.color_secondary)),
                    decoration: BoxDecoration(
                      color: AppColor.color_primary2,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("عن حجوزاتي",style: TextStyle(fontFamily: 'Cairo',fontSize: 16,fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("احجزلي هو تطبيق حجز رحلات الاكثر شمولاٌ في اليمن \nنوفر لك خدمه حجز سهله وسريعه مع أفضل الاسعار أعلئ معايير الجوده والسلامه نسعئ دائما لتوفير تجربه سفر مريحه وممتعه لجميع عملائنا."),
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Container(
                padding: EdgeInsets.all(10),
              width: 400,
              height: 150,
              child: Column(
                children: [
                  Text("تابعنا علئ",style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontWeight: FontWeight.w800,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('فيسبوك',style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
                            Icon(Icons.facebook),
                          ],
                        ) ,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('توتير',style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
                            Icon(Icons.token_rounded),
                          ],
                        ) ,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('انستقرام',style: TextStyle(fontFamily: 'Cairo',fontSize: 15)),
                            Icon(Icons.integration_instructions_outlined),
                          ],
                        ) ,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('البريد',style: TextStyle(fontFamily: 'Cairo',fontSize: 15),),
                            Icon(Icons.email_outlined),
                          ],
                        ) ,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
