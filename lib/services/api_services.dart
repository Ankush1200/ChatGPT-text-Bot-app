
import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_bot/constant/api_constant.dart';
import 'package:chatgpt_bot/models/model.dart';
import 'package:http/http.dart' as http;

class ApiService{
   static Future<List<ModelModels>>getModels() async{
    try{
      var response=await http.get(Uri.parse("$BASE_URL/models"),
      headers: {'Authorization': 'Bearer $API_KEY'});
      Map jsonResponse=jsonDecode(response.body);
      
      if(jsonResponse['error']!=null){
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("JsonResponse $jsonResponse");
      List temp =[];

      for(var value in jsonResponse["data"]){
        temp.add(value);
        // log("-----------temp ${value["id"]} ---------");
      } 
      return ModelModels.modelsFromSnapshot(temp);
    }catch(error){
      // log("-------------Error $error ---------------");
      rethrow;
    }
  }
}


