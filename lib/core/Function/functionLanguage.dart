import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/Widget/language_bottom_sheet.dart';

/// Opens a bottom sheet for language selection
Future<void> openLanguageSheet() async {
  await Get.bottomSheet(
    LanguageBottomSheet(),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
  );
}

