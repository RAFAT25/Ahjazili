import 'package:flutter/material.dart';

import '../../core/consta/Color.dart';

class SupportAndHelp extends StatelessWidget {
  const SupportAndHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الدعم والمساعده"),
        backgroundColor: AppColor.color_primary2,
        centerTitle: true,

      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerSupport(Titel: 'اتصل هاتفي',text: '778378882',icon: Icons.phone,textbutoon: 'اتصل الأن',),
                ContainerSupport(Titel: 'بريد إلكتروني',text: 'rafat@gmail.com',icon: Icons.email_outlined ,textbutoon: 'ارسل رساله',),
                ContainerSupport(Titel: 'دردشه مباشره',text: 'متاح علئ مدار الساعه',icon: Icons.phone,textbutoon: ' ابدا المحادثه',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class ContainerSupport extends StatelessWidget{
  final IconData? icon;
  final String? Titel;
  final String text;
   String? textbutoon;
   ContainerSupport({super.key, this.icon, this.Titel, this.textbutoon, required this.text,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius:BorderRadiusDirectional.all(Radius.circular(10)) ,
        color: Colors.white70,
      ),
      width: 120,
      height: 140,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 50,
            child: Icon(icon, color: AppColor.color_secondary, size: 25),
            decoration:  BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColor.color_primary,

            ),

          ),
          Text(Titel!),
          const SizedBox(height: 5,),
          Text(text),
          const SizedBox(height: 5,),
          Container(
            alignment: Alignment.center,
            width: 80,
            child: Text(textbutoon!),
            decoration:  BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: AppColor.color_primary3,
            ),

          ),
        ],
      ),
    );
  }

}