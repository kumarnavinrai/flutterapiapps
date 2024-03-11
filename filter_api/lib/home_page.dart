import 'package:filter_api/api_services.dart';
import 'package:filter_api/users_list_model.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  getUsersList () {
    setState(() {
      isLoading = true;
    });
    ApiServices().getUsersList().then((value) {
      _forMale(value!.users!);
      _forFemale(value!.users!);
      setState(() {
       isLoading = false;
       });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  //for male
  List<Users> maleList = [];
  List<Users> _forMale(List<Users> list){
    for(var element in list){
      if(element.gender == "male"){
        maleList.add(element);
      }
    }
    return maleList;
  }

  //for female
  List<Users> femaleList = [];
  List<Users> _forFemale(List<Users> list){
    for(var element in list){
      if(element.gender == "female"){
        femaleList.add(element);
      }
    }
    return femaleList;
  }


  @override
  void initState() {
    getUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Filter Api", style: TextStyle(color: Colors.white),),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              unselectedLabelColor: Colors.black,
              labelPadding: EdgeInsets.symmetric(vertical: 8),
              tabs: <Widget>[
                Text("Male"),
                Text("Female")
              ]),
        ),
        body: TabBarView(
          children: [
            _maleUsers(),
            _femaleUsers(),
          ],
        ),
      ),
    );
  }
  _maleUsers(){
    return isLoading? const Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: maleList.length,
        itemBuilder: (context, index){
          return ListTile(
              leading: CircleAvatar(
                child: Text((index+1).toString()),
              ),
              title: Text(maleList[index].gender.toString()),
          );
        });
  }
  _femaleUsers(){
    return isLoading? const Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: femaleList.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(
              child: Text((index+1).toString()),
            ),
            title: Text(femaleList[index].gender.toString()),
          );
        });
  }
}

