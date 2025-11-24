import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consta/Color.dart';

/// Shows a dialog to confirm app exit
/// 
/// Returns a Future that completes when the dialog is closed
Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق",
    content: const Text("هل تريد الخروج من التطبيق"),
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text('نعم'),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
          backgroundColor: MaterialStatePropertyAll(AppColor.color_primary),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'لا',
          style: TextStyle(
            color: AppColor.color_primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColor.color_secondary),
            ),
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
          backgroundColor: MaterialStatePropertyAll(AppColor.color_secondary),
        ),
      ),
    ],
  );

  return Future.value(true);
}

