import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consta/Color.dart';

/// Shows a bottom sheet for app exit confirmation
/// 
/// Returns a Future that completes when the bottom sheet is closed
Future<bool> showExitBottomSheet() {
  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    barrierColor: AppColor.color_primary,
    Container(
      height: 50,
      child: Column(
        children: [
          const Text("هل تريد الخروج من التطبيق"),
          Row(
            children: [
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
            ],
          ),
        ],
      ),
    ),
  );
  return Future.value(true);
}

