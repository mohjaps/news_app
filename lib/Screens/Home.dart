import 'package:flutter/material.dart';
import 'package:news_app/Screens/utalities.dart';
import 'package:news_app/Utls/Colors.dart';
import 'NewsScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Home';
  Widget screen = const NewsSc();

  @override
  Widget build(BuildContext context) {
    changeTitle(Widget screen, String title) {
      setState(() {
        this.title = title;
        this.screen = screen;
      });
    }

    return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: AppDrawer(tabfunc: changeTitle),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              centerTitle: true,
              title: Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: MajorColoors.primary,
            ),
            body: screen));
  }
}
