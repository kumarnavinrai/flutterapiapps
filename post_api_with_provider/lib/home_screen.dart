import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final  String  token;
  const HomeScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.brown,
        title: const Text("Home Screen",  style: TextStyle(color: Colors.white),),
      ),

      body: Center(
        child: Text("My token:  $token"),
      ),
    );
  }
}
