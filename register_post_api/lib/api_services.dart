import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;



class ApiServices{
  
  
  Future<RegisterModel?> register(String email, String password) async{

    try{
      var url = Uri.parse("https://reqres.in/api/register");

      var response = await http.post(url, body: {
        "email": email,
        "password": password
      });

      if(response.statusCode == 200){
        RegisterModel model = RegisterModel.fromJson(jsonDecode(response.body));
        return model;
      }
      
    }catch (e){
      print(e);
    }
    return null;
    
    
    
  }

  // With header code

  // Future<RegisterModel?> register(String email, String password) async {
  //   try {
  //     var url = Uri.parse("https://reqres.in/api/register");
  //
  //     var headers = {
  //       "Authorization": "Bearer {your access token}", // Replace with your actual token
  //     };
  //
  //     var response = await http.post(url, body: {
  //       "email": email,
  //       "password": password,
  //     }, headers: headers); // Pass the headers here
  //
  //     if (response.statusCode == 200) {
  //       RegisterModel model = RegisterModel.fromJson(jsonDecode(response.body));
  //       return model;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }



}