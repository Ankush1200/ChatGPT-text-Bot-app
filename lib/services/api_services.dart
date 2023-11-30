import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chatgpt_bot/constant/api_constant.dart';
import 'package:chatgpt_bot/models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // --------------send the request to get the models---------------

  static Future<List<ModelModels>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/models"),
          headers: {'Authorization': 'Bearer $API_KEY'});
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("JsonResponse $jsonResponse");
      List temp = [];

      for (var value in jsonResponse["data"]) {
        temp.add(value);
        // log("-----------temp ${value["id"]}} ---------");
      }
      // print(temp);
      return ModelModels.modelsFromSnapshot(temp);
    } catch (error) {
      // log("-------------Error $error ---------------");
      rethrow;
    }
  }

  // -----------send prompts to the chatGPT OPEN_AI_API---------------

  static Future<void> sendmessages(
      {required String message, required String modelid}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/chat/completions"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $API_KEY',
        },
        body: jsonEncode(
          {
            "model": modelid,
            "messages": [
              {"role": "user", "content": message}
            ],
            "temperature": 0.7
          },
        ),
      );
      Map<String,dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      print(jsonResponse["choices"][0]["message"]["content"]);
      // if(jsonResponse["choices"].lenth>0){
      //   // print("jsonResponse[choices]text ${jsonResponse["choices"][0]["message"]["content"]}");
      // }
      // print("JsonResponse $jsonResponse");
      
    } catch (error) {
      log("-------------Error $error ---------------");
      rethrow;
    }
  }
}
