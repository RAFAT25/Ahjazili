import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/Color.dart';
import 'package:travelsystem/core/consta/images.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';
import '../../controller/auth/AuthService.dart';
import '../../core/Funaction/showLogoutDialog.dart';
import '../Widget/language_bottom_sheet.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // احصل على الخدمة والبيانات (يمكنك استبدال التفاصيل من AuthService):
    final authService = Get.find<AuthService>();
    final userName = authService.userName ?? "زائر";
    final userEmail=authService.userEmail??"لا يوجد ايميل";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAndToNamed(AppRoute.MainController);
                },
                child: _userCard(userName, userEmail,authService.isGuest),
              ),
              InkWell(
                onTap: () => showLanguageBottomSheet(),
                child: Card_list(Icons.language, 'اللغة', 'تغيير لغه التطبيق'),
              ),
              Card_list(Icons.add_alert_rounded, 'إعدادات الأشعارات', 'إداره تفضيلات الإشعارات'),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.SupportAndHelp);
                },
                  child: Card_list(Icons.support_agent, 'الدعم والمساعدة', 'تواصل معنا وارسال التذاكر')),
              Card_list(Icons.question_mark, 'الأسئلة الشائعة', 'إجابات الأسئله الأكثر شيوعا'),
              InkWell(
                onTap: () => Get.toNamed(AppRoute.AboutApp),
                child: Card_list(Icons.info_outline, 'عن التطبيق', 'معلومات التطبيق وحقوق النشر'),
              ),
              InkWell(
                onTap: () => showLogoutDialog(context),
                child: Card_list(Icons.logout, 'تسجيل الخروج', ''),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // كارت يظهر بيانات المستخدم
  Widget _userCard(String name, String email, bool stuts) {
    return Card(
      borderOnForeground: true,
      margin: const EdgeInsets.all(10),
      shadowColor: AppColor.color_primary,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          width: 50,
          child: Icon(Icons.person, color: AppColor.color_secondary),
          decoration:  BoxDecoration(
            color: Color(0xffc333366),
            shape: BoxShape.circle,
          ),
        ),
        title: Text(name,style: TextStyle(fontFamily: 'Cairo',fontSize: 16,fontWeight: FontWeight.bold)),
        subtitle: Text(email),
        trailing: stuts==true?null:
        InkWell(
          onTap: (){

          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تعديل'),
                Icon(Icons.person_pin_rounded),
              ],
            ),
            height: 40,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
      ),
    );
  }
}

Widget Card_list(IconData icon, String title, String subtitle) {
  return Card(
    surfaceTintColor: AppColor.color_accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(10),
    ),
    borderOnForeground: true,

    shadowColor: AppColor.color_primary,
    child: ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        width: 50,
        child: Icon(icon, color: AppColor.color_secondary, size: 25),
        decoration:  BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColor.color_primary3,

        ),

      ),
      title: Text(title,style: TextStyle(fontFamily: 'Cairo',fontSize: 16,fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: const Icon(Icons.navigate_next),
    ),
  );
}
