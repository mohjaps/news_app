import 'package:flutter/material.dart';
import 'package:news_app/Screens/Login.dart';
import 'package:news_app/Screens/newss.dart';

import 'Screens/Home.dart';
import 'Screens/Landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Landing(),
    );
  }
}
