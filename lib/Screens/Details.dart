import 'package:flutter/material.dart';
import 'package:news_app/Models/sqldb.dart';
import 'package:news_app/Screens/newss.dart';
import 'package:news_app/Services/database.dart';
import 'package:news_app/Utls/Colors.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails(
      {Key? key, required this.title, required this.img, required this.body})
      : super(key: key);
  final String title;
  final String body;
  final String img;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  GlobalKey<ScaffoldState> keyy = new GlobalKey<ScaffoldState>();
  Sql sqldb = new Sql();
  List<NewsData>? dataList = null;
  @override
  void initState() {
    super.initState();
    Database.readData().then((value) => {
          setState(() => {dataList = value})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyy,
      appBar: AppBar(
        title: Text(
          widget.title,
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
              Image.network(widget.img),
              Positioned(
                  child: IconButton(
                    onPressed: () async {
                      int response = await sqldb.insertData('''
                    INSERT INTO news(`new`,`image`,`question`,`answer`)
                     VALUES("${widget.title}","${widget.img}","${widget.title}","${widget.body}")
                    ''');
                      final snackbar = SnackBar(
                        duration: Duration(days: 365),
                        content: Text("Insert Operation has been Successfully"),
                        action: SnackBarAction(
                          label: "Dismiss",
                          onPressed: () {},
                        ),
                      );
                      if (response > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Test()));
                      }
                    },
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
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.body,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
