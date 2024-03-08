import 'package:flutter/material.dart';

import '../models/single_post_model.dart';
import '../services/api_services.dart';


class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({Key? key}) : super(key: key);

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {


  bool isReady = false;

  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  _getSinglePost(){
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value){
      setState(() {
        singlePostWithModel = value!;
        isReady = false;
      });
    });
  }






  @override
  void initState() {
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Post With Model"),
        ),

        body: isReady == true?
        const Center(child: CircularProgressIndicator(),):

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(singlePostWithModel.userId.toString(), style: const TextStyle(fontSize: 20, color: Colors.blue),),

            Text(singlePostWithModel.title.toString(), style: const TextStyle(fontSize: 18, color: Colors.redAccent),),

            Text(singlePostWithModel.body.toString(), style: const TextStyle(fontSize: 15),)
          ],)
    );
  }
}