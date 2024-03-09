import 'package:flutter/material.dart';
import 'package:multi_data_api/screen_with_model.dart';
import 'package:multi_data_api/screen_without_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenWithModel(),
    );
  }
}
