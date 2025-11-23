class BusTrip {
  final String tripType, cityFrom, timeFrom, dateFrom, cityTo, timeTo, dateTo, duration;
  final int tripNumber, availableSeats, priceAdult, priceChild;
  final bool isVIP;

  BusTrip({
    required this.tripType,
    required this.cityFrom,
    required this.timeFrom,
    required this.dateFrom,
    required this.cityTo,
    required this.timeTo,
    required this.dateTo,
    required this.tripNumber,
    required this.availableSeats,
    required this.priceAdult,
    required this.priceChild,
    required this.isVIP,
    required this.duration,
  });
}
