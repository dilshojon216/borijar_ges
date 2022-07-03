import 'dart:convert';

import '../model/data_model.dart';
import 'package:http/http.dart' as http;

import '../model/pump_data_model.dart';
class ApiClient{

    String BASICURL="http://185.196.214.216:8000/";

  Future<DataModel> getLastData()async{
    try{
      var response = await http.get(Uri.parse("${BASICURL}data/last"),);
      if(response.statusCode==200){
        var jsonResponse = jsonDecode(response.body);
        return DataModel.fromJson(jsonResponse);
      }else{
        throw response.statusCode;
      }

    }catch(e){
     throw e.toString();
    }
  }


    Future<PumpDataModel> getLastPumpData()async{
      try{
        var response = await http.get(Uri.parse("${BASICURL}sped/last"),);
        if(response.statusCode==200){
          var jsonResponse = jsonDecode(response.body);
          print(jsonResponse);
          return PumpDataModel.fromJson(jsonResponse);
        }else{
          throw response.statusCode;
        }

      }catch(e){
        throw e.toString();
      }
    }

    Future<List<DataModel>> getLastListData()async{
      try{
        var response = await http.get(Uri.parse("${BASICURL}data"),);
        if(response.statusCode==200){
          var jsonResponse = jsonDecode(response.body);

          List<DataModel> lastHoursDataModels =
          List<DataModel>.from(jsonResponse
              .map((element) => DataModel.fromJson(element)));

          return lastHoursDataModels;
        }else{
          throw response.statusCode;
        }

      }catch(e){
        throw e.toString();
      }
    }

    Future<List<PumpDataModel>> getLastPumpListData()async{
      try{
        var response = await http.get(Uri.parse("${BASICURL}sped"),);
        if(response.statusCode==200){
          var jsonResponse = jsonDecode(response.body);

          List<PumpDataModel> lastHoursDataModels =
          List<PumpDataModel>.from(jsonResponse
              .map((element) => PumpDataModel.fromJson(element)));

          return lastHoursDataModels;
        }else{
          throw response.statusCode;
        }

      }catch(e){
        throw e.toString();
      }
    }
}