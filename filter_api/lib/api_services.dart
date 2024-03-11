import 'dart:convert';

import 'package:filter_api/users_list_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<UsersList> getUsersList () async {
    var response = await http.get(Uri.parse("https://dummyjson.com/users"));
    if(response.statusCode == 200){
      return UsersList.fromJson(jsonDecode(response.body));
    }else{
      return UsersList();
    }
  }
}