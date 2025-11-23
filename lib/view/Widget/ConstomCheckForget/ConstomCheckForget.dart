import 'package:flutter/material.dart';

class ConstomCheckForget extends StatelessWidget {
  final String nameimage;
  final String Text1;
  final String Text2;
  final String Text3;

  const ConstomCheckForget({super.key, required this.nameimage, required this.Text1, required this.Text2, required this.Text3});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 300,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(nameimage),fit: BoxFit.cover)
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Text(Text1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              SizedBox(height: 10,),
              Text(Text2,style: TextStyle(color: Colors.black54)),
              SizedBox(height: 5,),
              Text(Text3,style: TextStyle(color: Colors.black54),)
            ],
          ),
        ),
      ],
    );
  }
}
