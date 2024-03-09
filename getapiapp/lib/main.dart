import 'package:flutter/material.dart';
import 'package:getapiapp/screens/screen_with_model.dart';
import 'package:getapiapp/screens/screen_without_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenWithoutModel(),
    );
  }
}


