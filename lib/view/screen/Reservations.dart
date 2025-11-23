import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/consta/Color.dart';
import 'homepage.dart';

class Reservations extends StatelessWidget {
  const Reservations({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
     child: Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor: AppColor.color_secondary,
         bottom:TabBar(
             indicator: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               color:AppColor.color_primary,
             ),
             unselectedLabelColor: AppColor.color_primary,
             labelColor: AppColor.color_secondary,
             labelStyle: const TextStyle(fontSize: 15),
             indicatorColor: AppColor.color_primary,
             padding: EdgeInsets.all(20),
             tabs: [
               Tab(
                 text: 'قيد المراجعه'.tr,

               ),
               Tab(
                 text: 'مؤكده'.tr,
               ),
               Tab(
                 text: 'مدفوعه'.tr,
               ),
               Tab(
                 text: 'المنتهيه'.tr,
               ),
             ])
     ),
      body: TabBarView(
        children: [
          Homepage(),
          Homepage(),
          Homepage(),
          Homepage(),
      ],
      ),
     ),
    );
  }
}
