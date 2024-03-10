import 'package:api_with_provider/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'model.dart';

class ApiProvider with ChangeNotifier{


  late Model model;

  bool loading = true;

  getData()async{

    await ApiServices().getData().then((value){
      model = value;

    }).onError((error, stackTrace){
      
      print("Error");

    });
    loading = false;
    notifyListeners();
  }
}