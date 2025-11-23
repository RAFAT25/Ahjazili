import '../../../core/Class/crud.php.dart';
import '../../../core/consta/linke.dart';

class TestData{
  Crud  crud;
   TestData(this.crud);
   getdata()async{
     print('getdata called2025');
      var response=await crud.postMethod(AppLink.linklist_users,{});
      return response.fold((l) => l, (r) => r);
   }
}