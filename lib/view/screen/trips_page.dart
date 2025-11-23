import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/trip_controller.dart';
import '../Widget/bus_trip_card.dart';


class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TripController controller = Get.put(TripController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتائج البحث', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFFD6B15B),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: Obx(() {
        if (controller.loading.value)
          return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: controller.trips.length,
          itemBuilder: (context, index) =>
              BusTripCard(trip: controller.trips[index]),
        );
      }),
    );
  }
}
