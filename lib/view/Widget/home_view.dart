import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/controller/main_view_model.dart';
import 'package:travelsystem/core/consta/Color.dart';
import 'package:travelsystem/core/consta/images.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';

import '../../core/Funaction/AlertExiteApp.dart';
import 'bottomBarItem.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final MainViewModel controller = Get.find<MainViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.color_primary,
        onPressed: () {
          Get.toNamed(AppRoute.BookingView);
        },
        child: Icon(
          Icons.search,
          color: AppColor.color_secondary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.color_secondary,
        leading: InkWell(
          onTap: () => Get.toNamed(AppRoute.notification),
          child: Icon(Icons.notifications_outlined,
              color: AppColor.color_primary, size: 28),
        ),
        actions: [
          Container(
            width: 100,
            height: 80,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImage.image_logo), fit: BoxFit.contain),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () => AlertExiteApp(),
        child: Obx(
          () => PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: controller.navItems.map((item) => item.page).toList(),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildNavItems(controller),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems(MainViewModel controller) {
    List<Widget> items = [];
    for (int i = 0; i < controller.navItems.length; i++) {
      final item = controller.navItems[i];
      items.add(
        bottomBarItem(
          image: item.image,
          activeImage: item.activeImage,
          label: item.label,
          isActive: controller.selectedIndex.value == i,
          onTap: () => controller.onItemTapped(i),
        ),
      );
    }
    return items;
  }
}
