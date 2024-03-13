import 'package:flutter/material.dart';
import 'package:list_api_with_provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context,  listen: false).getResponse();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("List api with provider",  style: TextStyle(color: Colors.white),),
      ),


      body: Provider.of<ApiProvider>(context).isLoading?
          Center(child: CircularProgressIndicator(),):

          ListView.builder(
              itemCount: Provider.of<ApiProvider>(context).model.length,
              itemBuilder: (context,  index){
                return ListTile(
                  title: Text(Provider.of<ApiProvider>(context).model[index].name.toString()),
                    subtitle:  Text(Provider.of<ApiProvider>(context).model[index].email.toString()),
                );
              })
    );
  }
}
