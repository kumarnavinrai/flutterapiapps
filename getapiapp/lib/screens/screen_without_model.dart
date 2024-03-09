import 'package:flutter/material.dart';
import 'package:getapiapp/services/api_services.dart';


class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {

  dynamic singlePost;
  bool isReady = false;

  _getSinglePostWithoutModel(){
    isReady = true;
    ApiServices().getSinglePostWithoutModel().then((value){
      setState(() {
        singlePost = value;
        isReady = false;
      });
    }).onError((error, stackTrace){
      print(error);
      isReady = false;
    });
  }

  @override
  void initState() {
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Without Model"),
      ),
      body: isReady == true? const Center(child: CircularProgressIndicator(),)
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(singlePost["userId"].toString(), style: const TextStyle(color: Colors.pink, fontSize: 20),),
          Text(singlePost["title"].toString(), style: const TextStyle(color: Colors.black, fontSize: 17),),
          Text(singlePost["body"].toString(), style: const TextStyle(color: Colors.teal, fontSize: 15),),
        ],
      ),

    );
  }
}
