import '../../model/model/BusTrip.dart';


class TripService {
  Future<List<BusTrip>> fetchTrips() async {
    await Future.delayed(const Duration(seconds: 2)); // محاكاة تحميل بيانات
    return [
      BusTrip(
        tripType: 'رحلة دولية',
        cityFrom: 'مأرب',
        timeFrom: '10:00 AM',
        dateFrom: '23/11/2025',
        cityTo: 'الرياض',
        timeTo: '3:16 AM',
        dateTo: '24/11/2025',
        tripNumber: 25102938,
        availableSeats: 0,
        priceAdult: 350,
        priceChild: 350,
        isVIP: true,
        duration: '17 ساعات, 16 دقائق',
      ),
      BusTrip(
        tripType: 'رحلة دولية',
        cityFrom: 'مأرب',
        timeFrom: '8:00 AM',
        dateFrom: '23/11/2025',
        cityTo: 'الرياض',
        timeTo: '1:16 AM',
        dateTo: '24/11/2025',
        tripNumber: 25102877,
        availableSeats: 6,
        priceAdult: 350,
        priceChild: 350,
        isVIP: true,
        duration: '17 ساعات, 16 دقائق',
      ),
    ];
  }
}
