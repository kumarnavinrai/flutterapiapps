import 'package:flutter/material.dart';
import 'package:getapilist/api_services.dart';
import 'package:getapilist/post_model.dart';


class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({Key? key}) : super(key: key);

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  bool isReady = false;
  List<PostModel> postModel = [];
  _getPost(){
    isReady = true;
    ApiServices().getPostWithModel().then((value){
      setState(() {
        postModel = value!;
        isReady = false;
      });
    });
  }


  @override
  void initState() {
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts With Model"),
      ),



      body: isReady == true?
          const Center(child: CircularProgressIndicator(),):


          ListView.builder(
              itemCount: postModel.length,
              itemBuilder: (context, index){
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(postModel[index].id.toString()),
                    title: Text(postModel[index].title.toString()),
                    subtitle: Text(postModel[index].body.toString()),
                  ),
                );
              })
    );
  }
}
