import 'package:get/get.dart';

import '../../core/Class/StatusRequest.dart';
import '../../core/Funaction/handlingData.dart';
import '../../model/Datasource/remote/testData.dart';

class TestDataCintroller extends GetxController{

  TestData dataTest=TestData(Get.find());
  List data = [];
  StatRequst statRequst = StatRequst.Loding;

  Future<void> getdata() async {
    statRequst = StatRequst.Loding;
    update();
    var response = await dataTest.getdata();
    statRequst = handlingData(response);
    if (statRequst == StatRequst.succes) {
      data.clear();
      data.addAll(response);
    }
    update();
  }


  @override
  void onInit() {
    getdata();
    super.onInit();
  }

}