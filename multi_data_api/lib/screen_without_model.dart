import 'package:flutter/material.dart';
import 'package:multi_data_api/api_services.dart';


class ScreenWithOutModel extends StatefulWidget {
  const ScreenWithOutModel({Key? key}) : super(key: key);

  @override
  State<ScreenWithOutModel> createState() => _ScreenWithOutModelState();
}

class _ScreenWithOutModelState extends State<ScreenWithOutModel> {
  
  bool isReady = false;
  dynamic multiData;
  _getMultiData(){
    isReady = true;
    ApiServices().getMultiDataWithOutModel().then((value){
      setState(() {
        multiData = value;
        isReady = false;
      });
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
        title: const Text("Multi Data WithOut Model"),
      ),
      
      body: isReady == true?
          const Center(child: CircularProgressIndicator(),):
          
          
          Column(
            children: [
              Text(multiData["page"].toString(), style: const TextStyle(color: Colors.redAccent, fontSize: 20),),
              Text(multiData["page"].toString(), style: const TextStyle(color: Colors.redAccent, fontSize: 20),),
              Text(multiData["per_page"].toString(), style: const TextStyle(color: Colors.redAccent, fontSize: 20),),
              Text(multiData["total"].toString(), style: const TextStyle(color: Colors.redAccent, fontSize: 20),),
              Text(multiData["total_pages"].toString(), style: const TextStyle(color: Colors.redAccent, fontSize: 20),),


              Expanded(
                  child: ListView.builder(
                      itemCount: multiData["data"].length,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(multiData["data"][index]["id"].toString()),
                            ),
                            title: Text(multiData["data"][index]["name"].toString()),
                            subtitle: Text(multiData["data"][index]["pantone_value"].toString()),
                          ),
                        );
                      })
              ),
            ],
          )
    );
  }
}
