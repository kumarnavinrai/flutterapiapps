import 'dart:convert';
import 'multi_data_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{



  Future<MultiData?>  getMultiDataWithModel() async{
    
    try{
     var response =  await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if(response.statusCode == 200){
        MultiData model = MultiData.fromJson(json.decode(response.body));
        return model;
      }
    }catch (e){
      print(e);
    }
    return null;
  }





  Future<dynamic>  getMultiDataWithOutModel() async{

    try{
      var response =  await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if(response.statusCode == 200){
        final model = jsonDecode(response.body);
        return model;
      }
    }catch (e){
      print(e);
    }
    return null;
  }


}