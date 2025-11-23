import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/view/Widget/widget_Butoon.dart';
import '../../core/consta/Color.dart';
import '../../model/model/BusTrip.dart';


class BusTripCard extends StatelessWidget {
  final BusTrip trip;
  const BusTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    bool isFull = trip.availableSeats == 0;
    Color colorPrimary = const Color(0xFFD6B15B);
    Color colorError = Colors.red.shade300;
    Color colorSecondary = const Color(0xFF555555);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط النوع وVIP
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorPrimary),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(trip.tripType, style: TextStyle(color: colorPrimary)),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Text(trip.isVIP ? 'VIP' : 'عادي', style: TextStyle(color: colorSecondary, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Icon(Icons.directions_bus, color: Colors.brown, size: 18),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // المدن والأوقات
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip.cityTo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(trip.timeTo, style: TextStyle(fontSize: 16)),
                    Text(trip.dateTo),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(height: 1.8, margin: const EdgeInsets.symmetric(vertical: 4), color: colorPrimary),
                      Text(trip.duration, style: TextStyle(fontSize: 12)),
                      Text('رقم الرحلة ${trip.tripNumber}', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(trip.cityFrom, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(trip.timeFrom, style: TextStyle(fontSize: 16)),
                    Text(trip.dateFrom),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // المقاعد
            Row(
              children: [
                Icon(trip.availableSeats > 0 ? Icons.event_seat : Icons.event_seat_outlined, color: colorSecondary),
                Text(" ${trip.availableSeats} مقعد متوفر", style: TextStyle(color: colorSecondary)),
                const Spacer(),
                Icon(Icons.wifi, color: colorSecondary, size: 20),
                const SizedBox(width: 8),
                Icon(Icons.shield, color: colorSecondary, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            // الأسعار
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('للأطفال', style: TextStyle(color: colorSecondary)),
                      Text('${trip.priceChild} SAR', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('للكبار', style: TextStyle(color: colorSecondary)),
                      Text('${trip.priceAdult} SAR', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: WidegtBtuoon(
                onPressed: () {
                },
                backgroundColor: AppColor.color_primary,
                child:
                    Text('تفاصيل الرحله'.tr)

              ),
            ),
          ],
        ),
      ),
    );
  }
}
