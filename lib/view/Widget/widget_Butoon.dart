// file: view/Widget/widget_Butoon.dart

import 'package:flutter/material.dart';

class WidegtBtuoon extends StatelessWidget {
  // 1. التعديل الأول: أضفنا '?' لجعل onPressed يقبل null
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String? text; // جعل النص اختياريًا
  final Widget? child; // 2. التعديل الثاني: أضفنا child

  const WidegtBtuoon({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    this.text, // لم يعد required
    this.child, // معامل جديد
  }) : assert(text != null || child != null, 'يجب توفير إما text أو child'); // تأكيد

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55, // تحديد ارتفاع ثابت لشكل أفضل
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          // 3. التعديل الثالث: لون مخصص للزر عند تعطيله
          disabledBackgroundColor: backgroundColor.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            // تأكد من وجود AppStyel.borderRadius أو استبدلها بقيمة ثابتة
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: onPressed == null ? 0 : 2, // إزالة الظل عند تعطيل الزر
        ),
        onPressed: onPressed, // الآن يقبل null بدون مشاكل

        // 4. التعديل الرابع: منطق عرض ذكي
        // إذا كان child موجودًا، اعرضه. وإلا، اعرض النص.
        child: child ??
            Text(
              text ?? '', // استخدام النص إذا كان موجودًا
              style: const TextStyle(
                color: Colors.white, // إضافة لون للنص لضمان الوضوح
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Cairo',
              ),
            ),
      ),
    );
  }
}
