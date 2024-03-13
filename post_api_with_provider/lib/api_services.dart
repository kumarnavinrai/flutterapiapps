import 'dart:convert';
import 'package:http/http.dart' as  http;

class ApiServices{
  
  
  Future<dynamic>  userLogin(String email, String password)async{

    dynamic apiResponse;
    
    final response = await  http.post(Uri.parse("https://reqres.in/api/login"),
      body: {
        "email": email,
        "password": password
      }
    );

    if(response.statusCode  ==200){
      apiResponse =  jsonDecode(response.body);
    }

    return apiResponse;
  }
}