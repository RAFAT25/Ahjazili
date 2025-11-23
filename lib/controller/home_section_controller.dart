import 'package:get/get.dart';
import 'package:travelsystem/core/consta/images.dart'; // تأكد من المسار

class HomeSectionController extends GetxController {
  // --- State for HomeSection Content ---

  /// بيانات السلايدر
  final List<String> sliderImages = [
    AppImage.image_ops_server,
    AppImage.image_ops_server,
    AppImage.image_ops_server,
  ];

  /// بيانات شعارات الشركات
  final List<String> companyLogos = [
    AppImage.image_logo,
    AppImage.image_logo,
    AppImage.image_logo,
    AppImage.image_logo,
  ];

  /// متغير لتتبع الصفحة الحالية في السلايدر
  var currentSliderIndex = 0.obs;

  // --- UI Event Handlers ---

  /// تُستدعى عند تغيير الصفحة في السلايدر
  void onSliderPageChanged(int index) {
    currentSliderIndex.value = index;
  }
}
