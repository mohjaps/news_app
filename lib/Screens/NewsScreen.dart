import 'dart:math';
import 'package:flutter/material.dart';
import 'package:news_app/Models/news.dart';
import '../Services/NewsService.dart';
import 'Details.dart';

class NewsSc extends StatefulWidget {
  const NewsSc({Key? key}) : super(key: key);

  @override
  State<NewsSc> createState() => _NewsScState();
}

class _NewsScState extends State<NewsSc> {
  List<News>? _news = null;
  @override
  void initState() {
    super.initState();
    NewsService.getAll().then((value) {
      setState(() {
        _news = value;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _news == null
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Breaking News',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView.builder(
                  itemCount: _news!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      elevation: 5,
                      child: Stack(
                        children: [
                          Image.network(_news![index].img),
                          ListTile(
                            title: Text(
                              _news![index].title.substring(
                                      0, min(30, _news![index].title.length)) +
                                  '...',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              _news![index].body.substring(
                                      0, min(50, _news![index].body.length)) +
                                  '...',
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetails(
                                            title: _news![index].title,
                                            body: _news![index].body,
                                            img: _news![index].img,
                                          )));
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
