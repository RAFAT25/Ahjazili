import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/BookingController.dart';
import '../../core/Class/StatusRequest.dart';
import '../../core/consta/Color.dart';
import '../Widget/NoInternetWidget.dart';
import '../Widget/widget_Butoon.dart';


class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("44".tr,style: TextStyle(color: AppColor.color_primary,fontSize: 20),),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded,color: AppColor.color_primary),
        ),
      ),
      body: Center(
        child: Obx(() {
          if (controller.requst.value == StatRequst.noInternet) {
            return NoInternetWidget(onRetry: controller.searchTrips);
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Color(0xFFF8F7F6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(width: 11, height: 11, decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                            Container(width: 2, height: 48, color: Colors.black26),
                            Container(width: 11, height: 11, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: _buildDropdownCities(context)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _buildTripTypeDropdown(),
                    const SizedBox(height: 14),
                    _buildDateField(context),
                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: WidegtBtuoon(
                        onPressed: () => controller.searchTrips(),
                        backgroundColor: AppColor.color_primary,
                        child: Obx(() =>
                        controller.requst.value == StatRequst.Loding
                            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
                            : Text('13'.tr)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDropdownCities(BuildContext context) {
    return Column(
      children: [
        Obx(() => DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "مدينة الانطلاق",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.white,
            filled: true,
          ),
          value: controller.cities.contains(controller.departureCity.value)
              ? controller.departureCity.value : null,
          items: controller.cities
              .where((city) => city != controller.arrivalCity.value)
              .map((city) => DropdownMenuItem(
            value: city,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(city, textAlign: TextAlign.right),
                SizedBox(width: 8),
                Icon(Icons.location_city, color: AppColor.color_primary, size: 18),
              ],
            ),
          )).toList(),
          onChanged: controller.setDepartureCity,
          isExpanded: true,
        )),
        SizedBox(height: 10),
        Obx(() => DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "إلى",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColor.color_primary)),
            fillColor: Colors.white,
            filled: true,
          ),
          value: controller.cities.contains(controller.arrivalCity.value)
              ? controller.arrivalCity.value : null,
          items: controller.cities
              .where((city) => city != controller.departureCity.value)
              .map((city) => DropdownMenuItem(
            value: city,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(city, textAlign: TextAlign.right, style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                Icon(Icons.location_city, color: AppColor.color_primary, size: 18),
              ],
            ),
          )).toList(),
          onChanged: controller.setArrivalCity,
          isExpanded: true,
        )),
      ],
    );
  }

  Widget _buildTripTypeDropdown() {
    return Obx(() => DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "نوع الرحلة",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        fillColor: Colors.white,
        filled: true,
      ),
      value: controller.selectedTripType.value,
      items: controller.tripTypes
          .map((type) => DropdownMenuItem(
        value: type,
        child: Text(type, textAlign: TextAlign.right),
      )).toList(),
      onChanged: controller.setTripType,
      isExpanded: true,
    ));
  }

  Widget _buildDateField(BuildContext context) {
    return Obx(() => InkWell(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: controller.travelDate.value,
          firstDate: DateTime(2025),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColor.color_primary,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.color_primary,
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) controller.setDate(picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.09),
              blurRadius: 16,
              offset: Offset(0, 7),
            ),
          ],
          border: Border.all(color: AppColor.color_primary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today_rounded, color: AppColor.color_primary, size: 28),
                const SizedBox(width: 12),
                Text('التاريخ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColor.color_primary)),
              ],
            ),
            Text(
              DateFormat('dd/MM/yyyy', 'en').format(controller.travelDate.value),
              style:  TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: AppColor.color_primary),
            ),
          ],
        ),
      ),
    ));
  }
}
