import 'package:api_with_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Apis call"),
      ),


      body: provider.loading?
          const Center(child: CircularProgressIndicator(color: Colors.teal,),):


          ListView.builder(
            itemCount: provider.model.data!.length,
              itemBuilder: (context, index){
              return ListTile(
                title: Text(provider.model.data![index].firstName.toString()),
                subtitle: Text(provider.model.data![index].email.toString()),
              );
              })
    );
  }
}
