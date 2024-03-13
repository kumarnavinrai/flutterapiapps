import 'dart:convert';
import 'package:http/http.dart' as  http;

import 'model.dart';

class ApiServices{

  Future<List<Model>?> getData()async{

    
    final  response =  await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));


    if(response.statusCode  == 200 || response.statusCode == 201){

      List<Model>  model = List<Model>.from(json.decode(response.body).map((x)=> Model.fromJson(x)));

      return  model;
    }

    return null;
  }
}