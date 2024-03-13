import 'package:flutter/cupertino.dart';
import 'package:list_api_with_provider/api_services.dart';
import 'package:list_api_with_provider/model.dart';

class  ApiProvider  with ChangeNotifier{

  bool  isLoading =  true;
  late  List<Model> model;

  getResponse()async{
    await ApiServices().getData().then((value){

      model =  value!;

    }).onError((error, stackTrace){
      print(error.toString());
    });

    isLoading  =  false;
    notifyListeners();
  }

}