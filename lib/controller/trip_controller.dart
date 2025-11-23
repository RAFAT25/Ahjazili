import 'package:get/get.dart';
import '../core/Serveses/trip_service.dart';
import '../model/model/BusTrip.dart';
class TripController extends GetxController {
  RxList<BusTrip> trips = <BusTrip>[].obs;
  RxBool loading = false.obs;

  Future<void> getTrips() async {
    loading.value = true;
    trips.value = await TripService().fetchTrips();
    loading.value = false;
  }

  @override
  void onInit() {
    getTrips();
    super.onInit();
  }
}
