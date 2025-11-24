import '../../../core/Class/crud.dart';
import '../../../core/consta/link.dart';

/// Data source for test data operations
class TestData {
  final Crud crud;
  
  TestData(this.crud);
  
  /// Fetches test data from the remote server
  /// 
  /// Returns the response data or status
  Future<dynamic> getData() async {
    var response = await crud.postMethod(AppLink.linkListUsers, {});
    return response.fold((l) => l, (r) => r);
  }
}
