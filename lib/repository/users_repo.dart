import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UsersRepo{

    static Future<dynamic> getUser()async{

      dynamic jsonResponse;
      Uri url = Uri.http('jsonplaceholder.typicode.com','/users');
      try{
      final  response = await http.get(url);
        if(response.statusCode == 200){
          print(response.body);
          jsonResponse = jsonDecode(response.body);
        }
        return jsonResponse;
      }catch(e){
        if(kDebugMode){
          print(e.toString());
          return jsonResponse;
        }
      }
    }

}