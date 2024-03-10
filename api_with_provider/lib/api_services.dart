import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class ApiServices{
  
  Future<Model> getData()async{

    late Model model;

    final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));


    if(response.statusCode == 200 || response.statusCode == 201){

      model = Model.fromJson(json.decode(response.body));
    }else{
      print( "Error");
    }

    return model;
}
}