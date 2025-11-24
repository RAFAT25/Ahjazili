import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'core/Class/StatusRequest.dart';
import 'controller/test/testController.dart';
import 'core/consta/Color.dart';
import 'core/consta/images.dart';
import 'core/consta/dimensions.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات المستخدمين'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<TestDataController>(
          builder: (controller) {
            if (controller.statusRequest == StatusRequest.loading) {
              return Center(
                child: Image.asset(
                  AppImage.image_setting_active,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              );
            } else if (controller.statusRequest ==
                StatusRequest.serverFailure) {
              return Center(
                child: Image.asset(
                  AppImage.image_ops_server,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              );
            } else if (controller.statusRequest ==
                StatusRequest.offlineFailure) {
              return Center(
                child: Image.asset(
                  AppImage.image_forget,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  var view = controller.data[index];
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.marginMedium,
                      vertical: AppDimensions.marginSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.color_primary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppDimensions.radiusXXLarge),
                        bottom: Radius.circular(AppDimensions.radiusXXLarge),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColor.color_primary,
                        size: AppDimensions.imageSizeSmall,
                      ),
                      title: Text(
                        view['full_name'],
                        style: TextStyle(
                          fontSize: AppDimensions.fontSizeTitle,
                          color: AppColor.color_secondary,
                        ),
                      ),
                      subtitle: Text(
                        view['email'],
                        style: TextStyle(fontSize: AppDimensions.fontSizeLarge),
                      ),
                      trailing: Container(
                        width: 60,
                        child: Row(
                          children: [
                            Icon(Icons.delete_rounded),
                            SizedBox(width: AppDimensions.spacingSmall),
                            Icon(Icons.note_alt_sharp),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
