import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;

class ApiServices{


  Future<LoginModel?> loginWithModel( String email, String password)async{
    
    try{
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password
      });


      if(response.statusCode == 200){
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    }catch (e){
      print(e);
    }
    return null;
  }






  Future<dynamic> loginWithOutModel( String email, String password)async{

    try{
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password
      });


      if(response.statusCode == 200){
        final model = jsonDecode(response.body);
        return model;
      }
    }catch (e){
      print(e);
    }
  }



}