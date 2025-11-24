import 'package:get/get.dart';
import '../core/Services/tripService.dart';
import '../model/model/BusTrip.dart';

/// Controller for managing trip data
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
