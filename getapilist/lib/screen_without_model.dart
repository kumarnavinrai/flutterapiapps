import 'package:flutter/material.dart';

import 'api_services.dart';


class ScreenWithOutModel extends StatefulWidget {
  const ScreenWithOutModel({Key? key}) : super(key: key);

  @override
  State<ScreenWithOutModel> createState() => _ScreenWithOutModelState();
}

class _ScreenWithOutModelState extends State<ScreenWithOutModel> {
  
  // bool isReady = false;
  // dynamic postList = [];
  // _getPost(){
  //   isReady = true;
  //   ApiServices().getPostWithOutModel().then((value){
  //     setState(() {
  //       postList = value;
  //       isReady = false;
  //     });
  //   }).onError((error, stackTrace){
  //     print(error);
  //   });
  // }
  //
  //
  //
  // @override
  // void initState() {
  //   _getPost();
  //   super.initState();
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts WithOut Model"),
      ),

      // body: isReady == true?
      //     const Center(child: CircularProgressIndicator(),):
      //    
      //     ListView.builder(
      //         itemCount: postList.length,
      //         itemBuilder: (context, index){
      //           return Card(
      //             child: ListTile(
      //               leading: Text(postList[index]["id"].toString()),
      //               title: Text(postList[index]["title"].toString()),
      //               subtitle: Text(postList[index]["body"].toString()),
      //             ),
      //           );
      //         }),
      

      body: FutureBuilder(
          future: ApiServices().getPostWithOutModel(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return Card(
                      margin: EdgeInsets.all(20),
                      child:  ListTile(
                        title: Text(snapshot.data[index]["title"].toString(), style: const TextStyle(color: Colors.redAccent),),
                        subtitle: Text(snapshot.data[index]["body"].toString(), style: const TextStyle(color: Colors.blue),),
                      ),
                    );
                  });
            }else{
             return const Center(child: CircularProgressIndicator(),);
            }
          }),
      
    );
  }
}
