import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        Container(
          height: 270,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 5)),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                BoxShadow(color: Colors.white, offset: Offset(5, 0))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image(
                  height: 190,
                  width: double.infinity,
                  image: AssetImage(
                      "assets/images/how-google-maps-knows-youre-braking-hard-so-it-can-find-safer-routes-162191_1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 17, bottom: 10),
                child: Text(
                  "26 22b St, Dubai",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17, bottom: 10),
                child: Text(
                  "United Arab Emirates",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 30, left: 45, bottom: 20),
          child: Text(
            "Let's Get In Touch!",
            style: TextStyle(
                wordSpacing: 3,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 35, right: 17),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFc99200),
                  borderRadius: BorderRadius.circular(40)),
              child: Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
            Container(
              child: Text(
                "online.course@info.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 35,
                right: 17,
                top: 15,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFc99200),
                  borderRadius: BorderRadius.circular(40)),
              child: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "759-542-1789",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 60,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusColor: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 60,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusColor: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 60,
          child: TextFormField(
            // maxLines: 7,
            autovalidateMode: AutovalidateMode.always,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Your Message",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusColor: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 236, 183, 191),
                ),
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ),
      ]),
    );
  }
}
