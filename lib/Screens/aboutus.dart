import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Who We Are",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Image.asset(
              "assets/images/gettyimages-627909282_1200xx5760-3246-0-197.jpg",
              height: 300,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Continue the pattern of giving examples and explaining them until all points/examples that the writer deems necessary have been made and explained. NONE of your examples should be left unexplained.",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), height: 1.5),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "From the list above, let’s choose “illustration” as our rhetorical purpose. We’ll walk through a 5-step process for building a paragraph that illustrates a point in an argument.",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), height: 1.5),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Our Trainers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Image.asset(
                          "assets/images/Johnny-Depp-Cutting-News-e1609230062237.jpg",
                          height: 220,
                          width: 220,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Image.asset(
                          "assets/images/Johnny-Depp-Cutting-News-e1609230062237.jpg",
                          height: 220,
                          width: 220,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
