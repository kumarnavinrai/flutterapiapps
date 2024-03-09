import 'package:flutter/material.dart';
import 'package:multi_data_api/api_services.dart';
import 'package:multi_data_api/multi_data_model.dart';


class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({Key? key}) : super(key: key);

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  
  MultiData multiData = MultiData();
  bool isReady = false;
  _getMultiData(){
    isReady = true;
    ApiServices().getMultiDataWithModel().then((value){
      setState(() {
        multiData = value!;
        isReady = false;
      });
    }).onError((error, stackTrace){
      print(error);
    });
  }
  
  
  
  @override
  void initState() {
    _getMultiData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Multi Data With Model"),
      ),
      
      
      body: isReady == true?
          const Center(child: CircularProgressIndicator(),):

      Column(
        children: [
          Text(multiData.page.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),
          Text(multiData.total.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),
          Text(multiData.totalPages.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),
          Text(multiData.support!.text.toString(), style: const TextStyle(color: Colors.teal, fontSize: 18),),



          Expanded(
              child: ListView.builder(
                  itemCount: multiData.data!.length,
                  itemBuilder: (context, i){
                    return Card(
                      child: ListTile(
                        title: Text(multiData.data![i].name.toString()),
                        subtitle: Text(multiData.data![i].pantoneValue.toString()),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
