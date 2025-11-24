import 'package:get/get.dart';

import '../../core/Class/StatusRequest.dart';
import '../../core/Function/handlingData.dart';
import '../../core/Function/errorHandler.dart';
import '../../model/Datasource/remote/testData.dart';

/// Controller for managing test data
/// 
/// Handles fetching and managing test user data
class TestDataController extends GetxController {
  final TestData dataTest = TestData(Get.find());
  List<Map<String, dynamic>> data = [];
  StatusRequest statusRequest = StatusRequest.loading;

  /// Fetches test data from the remote source
  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      var response = await dataTest.getData();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        data.clear();
        if (response is List) {
          data.addAll(response.cast<Map<String, dynamic>>());
        }
      } else {
        ErrorHandler.handleStatusError(statusRequest);
      }
    } catch (e, stackTrace) {
      statusRequest = StatusRequest.failure;
      ErrorHandler.handleError(e, stackTrace, context: 'TestDataController');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}

