import 'package:flutter/material.dart';
import 'package:news_app/Utls/Colors.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(
      {Key? key, required this.title, required this.img, required this.body})
      : super(key: key);
  final String title;
  final String body;
  final String img;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: MajorColoors.primary,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Stack(children: [
                Image.network(img),
                const Positioned(
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.bookmark_add,
                        color: Colors.white,
                      ),
                    ),
                    top: 0,
                    right: 0),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                body,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
