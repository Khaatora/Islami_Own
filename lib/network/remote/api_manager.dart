import 'dart:convert';

import 'package:islami_own/models/radio_response.dart';
import 'package:http/http.dart' as http;
import 'package:islami_own/shared/constants.dart';

class ApiManager{



  static Future<RadioResponse> getRadios(String lang) async{
    var uri = Uri.https(BASE, "api/v3/radios", {
      "language": (lang=="ar"? "ar" : "eng"),
    });
    try{
      http.Response response = await http.get(uri);
      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        return RadioResponse.fromJson(json);
      }
      else{
        throw Exception("Failed to load radios");
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }
}