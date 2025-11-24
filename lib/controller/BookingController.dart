import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../core/Class/StatusRequest.dart';
import '../core/Function/checkInternet.dart';
import '../view/screen/trips_page.dart';

/// Controller for managing booking operations
class BookingController extends GetxController {
  final List<String> cities = ['صنعاء', 'عدن', 'تعز', 'الحديدة', 'إب', 'الرياض'];
  final request = StatusRequest.success.obs;

  final List<String> tripTypes = ['VIP', 'عادي'];

  var departureCity = 'صنعاء'.obs;
  var arrivalCity = 'عدن'.obs;
  var selectedTripType = 'VIP'.obs;
  var travelDate = DateTime.now().obs;

  void setDepartureCity(String? city) {
    if (city != null) departureCity.value = city;
    if (city != null && arrivalCity.value == city) {
      arrivalCity.value = cities.firstWhere((c) => c != city, orElse: () => cities[0]);
    }
  }

  void setArrivalCity(String? city) {
    if (city != null) arrivalCity.value = city;
    if (city != null && departureCity.value == city) {
      departureCity.value = cities.firstWhere((c) => c != city, orElse: () => cities[0]);
    }
  }

  void setTripType(String? type) {
    if (type != null) selectedTripType.value = type;
  }

  void setDate(DateTime dt) {
    travelDate.value = dt;
  }


  /// Searches for available trips based on selected criteria
  Future<void> searchTrips() async {
    if (!await checkInternet()) {
      request.value = StatusRequest.noInternet;
      return;
    }
    request.value = StatusRequest.loading;
    final Map<String, dynamic> requestData = {
      'from_stop': departureCity.value,
      'to_city': arrivalCity.value,
      'bus_class': selectedTripType.value,
      'date': DateFormat('yyyy-MM-dd').format(travelDate.value),
    };
    try {
      final uri = Uri.parse('https://travelsystemoline.onrender.com/serchTrip.php');
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestData),
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['success'] == true && result['trips'] != null) {
          request.value = StatusRequest.success;
          Get.snackbar('تم البحث', 'عدد الرحلات: ${result['trips'].length}');
          Get.to(() => TripsPage(), arguments: result['trips']);
        } else {
          request.value = StatusRequest.offlineFailure;
          Get.snackbar('خطأ في البحث', result['error'] ?? 'لم يتم العثور على رحلات مناسبة');
        }
      } else {
        request.value = StatusRequest.offlineFailure;
        Get.snackbar('خطأ في البحث', 'لم يتم العثور على رحلات مناسبة');
      }
    } catch (e) {
      request.value = StatusRequest.offlineFailure;
      Get.snackbar('خطأ', 'حدث خطأ أثناء البحث: $e');
    }
  }

}
