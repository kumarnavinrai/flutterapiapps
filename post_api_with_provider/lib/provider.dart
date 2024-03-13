import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_api_with_provider/api_services.dart';
import 'package:post_api_with_provider/home_screen.dart';

class  ApiProvider  with ChangeNotifier{

  bool  isLoading  = false;

  getData(BuildContext context,String email, String password)async{

    isLoading =  true;
    notifyListeners();

    ApiServices().userLogin(email, password).then((value){

      print(value);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(
        token : value['token'].toString(),
      )));

      isLoading =  false;
      notifyListeners();

    }).onError((error, stackTrace){
      print(error);
      isLoading =  false;
      notifyListeners();
    });
}

}