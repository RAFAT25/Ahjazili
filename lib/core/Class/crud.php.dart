import 'package:travelsystem/core/Funaction/checkEnternet.dart';
import 'package:http/http.dart' as http;
import 'StatusRequest.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'dart:io';
class Crud{

  Future<Either<StatRequst,List>> postMethod(linkeurl,Map data)async{
    try{
      if( await checkInternet()){
        print("dhshfks");
        var response=await http.get(Uri.parse(linkeurl));
        if(response.statusCode==200|| response.statusCode==201){
           print(response.body);
          List resposeData=json.decode(response.body);
          print(resposeData);
          return Right(resposeData);
        }
        else{
          return Left(StatRequst.serverfielure);
        }
      }
      else{
        return const Left(StatRequst.oflinefielure);
      }
    }
    catch(_){
       return const Left(StatRequst.oflinefielure);
    }
  }
  Future putMethod()async{

  }
  Future deleteMethod()async{

  }
  Future getMethod()async{

  }
}