import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Models/sqldb.dart';
import '../Services/database.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
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
    return Container(
        child: dataList == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataList!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image(
                          height: 190,
                          width: double.infinity,
                          image: AssetImage(
                              "assets/images/${dataList![index].image}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 20, left: 17, bottom: 10),
                        child: Text(
                          "${dataList![index].news}",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }));

    // FutureBuilder(builder:
    //     (BuildContext context, AsyncSnapshot<List<NewsData>> snapshot) {
    //   Future:
    //   readData();
    //   if (snapshot.hasData) {
    //     return ListView.builder(
    //         physics: const NeverScrollableScrollPhysics(),
    //         shrinkWrap: true,
    //         itemCount: snapshot.data!.length,
    //         itemBuilder: (context, index) {
    //           return Column(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: const BorderRadius.only(
    //                     topLeft: Radius.circular(15),
    //                     topRight: Radius.circular(15)),
    //                 child: Image(
    //                   height: 190,
    //                   width: double.infinity,
    //                   image: NetworkImage(
    //                       "assets/images/${snapshot.data![index].image}"),
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //               Container(
    //                 margin: const EdgeInsets.only(
    //                     top: 20, left: 17, bottom: 10),
    //                 child: Text(
    //                   "${snapshot.data![index].news}",
    //                   style: const TextStyle(
    //                       fontSize: 15,
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ],
    //           );
    //         });
    //   }
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }),
  }
}

class NewsData {
  late int id;
  late String news, image, question, answer;

  NewsData(
      {required this.id,
      required this.news,
      required this.image,
      required this.question,
      required this.answer});
}
