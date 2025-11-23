import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/Funaction/openDialog.dart';
import '../../core/consta/Color.dart';
import 'homepage.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("44".tr,style: TextStyle(color: AppColor.color_primary,fontSize: 20),),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded,color: AppColor.color_primary),
          ),
          bottom:TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:AppColor.color_primary,
              ),
              unselectedLabelColor: AppColor.color_primary,
              labelColor: AppColor.color_secondary,
              labelStyle: const TextStyle(fontSize: 15),
              indicatorColor: AppColor.color_primary,
              tabs: [
                 Tab(
                  text: '45'.tr,
                ),
                 Tab(
                  text: '46'.tr,
                ),
                 Tab(
                  text: '48'.tr,
                ),
                 Tab(
                  text: '47'.tr,
                ),
          ]) ,
        ),
        body:  TabBarView(
          children: [
            Homepage(),
            GestureDetector(
              onTap: () async{
                  await openDialog(context);
              },
                child: Card_list(Icons.ac_unit_rounded,'تاكيد حجز','تم تاكيد حجزك للرحله رقم TR-4545الئ رياض')),
            Card_list(Icons.ac_unit_rounded,'تذكير للرحله','رحلتك الئ صنعاء غدا في تمام الساعه 2:00م '),
            Card_list(Icons.ac_unit_rounded,' شاركنا رايك في رحلتك ','رحلتك من تعز الئ مكه قد انتهت..شاركنا رايك لتقييم التجربه'),
          ],
        ),
      ),
    );
  }
}
