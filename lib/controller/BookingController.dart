import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../core/Class/StatusRequest.dart';
import '../core/Funaction/checkEnternet.dart';
import '../view/screen/trips_page.dart';

class BookingController extends GetxController {
  final List<String> cities = ['صنعاء', 'عدن', 'تعز', 'الحديدة', 'إب', 'الرياض'];
  final requst = StatRequst.succes.obs;

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


  Future<void> searchTrips() async {
    if (!await checkInternet()) {
      requst.value = StatRequst.noInternet;
      return;
    }
    requst.value = StatRequst.Loding;
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
          requst.value = StatRequst.succes;
          Get.snackbar('تم البحث', 'عدد الرحلات: ${result['trips'].length}');
          Get.to(() => TripsPage(), arguments: result['trips']);
        } else {
          requst.value = StatRequst.oflinefielure;
          Get.snackbar('خطأ في البحث', result['error'] ?? 'لم يتم العثور على رحلات مناسبة');
        }
      } else {
        requst.value = StatRequst.oflinefielure;
        Get.snackbar('خطأ في البحث', 'لم يتم العثور على رحلات مناسبة');
      }
    } catch (e) {
      requst.value = StatRequst.oflinefielure;
      Get.snackbar('خطاء', 'حدث خطأ أثناء البحث: $e');
    }
  }

}
