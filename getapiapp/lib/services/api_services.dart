import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/single_post_model.dart';

class ApiServices{


  // With Model
  Future<SinglePostWithModel?> getSinglePostWithModel()async{
    try{

      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if(response.statusCode == 200){
        SinglePostWithModel model = SinglePostWithModel.fromJson(json.decode(response.body));
        return model;
      }
    }catch (e){
      print(e.toString());
    }
    return null;
  }





  // WithOut Model
  Future<dynamic> getSinglePostWithoutModel()async{
    try{

      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data;
      }
    }catch (e){
      print(e.toString());
    }
    return null;
  }






}