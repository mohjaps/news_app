// Input Field
import 'package:flutter/material.dart';
import 'package:news_app/Screens/Settings.dart';
import 'package:news_app/Screens/aboutus.dart';
import 'package:news_app/Screens/contactus.dart';
import 'package:news_app/Utls/Colors.dart';

import '../Services/auth.dart';
import 'Login.dart';
import 'NewsScreen.dart';

class InputField extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const InputField(
      {Key? key,
      required this.text,
      required this.icon,
      required this.controller,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
          )),
    );
  }
}

// Submit Button
class SubmitBtn extends StatelessWidget {
  const SubmitBtn({Key? key, required this.text, required this.submitBTN})
      : super(key: key);
  final String text;
  final Function submitBTN;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: TextButton(
          onPressed: () => submitBTN(),
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Color.fromARGB(255, 236, 183, 191),
              minimumSize: Size.infinite)),
    );
  }
}

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key, this.tabfunc}) : super(key: key);
  Function? tabfunc;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar Image
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.w3schools.com%2Fhowto%2Fimg_avatar2.png&f=1&nofb=1'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  if (tabfunc != null) tabfunc!(const NewsSc(), 'Home');
                },
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.home),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                iconColor: MajorColoors.primary,
              ),
              ListTile(
                iconColor: MajorColoors.primary,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.favorite),
                    SizedBox(width: 10),
                    Text(
                      'Favorite',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (tabfunc != null) tabfunc!(Container(), 'Test');
                },
              ),
              ListTile(
                iconColor: MajorColoors.primary,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.group),
                    SizedBox(width: 10),
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (tabfunc != null) tabfunc!(const AboutUs(), 'About Us');
                },
              ),
              ListTile(
                iconColor: MajorColoors.primary,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.contact_support),
                    SizedBox(width: 10),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (tabfunc != null)
                    tabfunc!(const ContactUs(), 'Contact Us');
                },
              ),
              ListTile(
                iconColor: MajorColoors.primary,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.settings),
                    SizedBox(width: 10),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (tabfunc != null) tabfunc!(const Settings(), 'Settings');
                },
              ),
              ListTile(
                iconColor: MajorColoors.primary,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => Login()));
                },
              ),
            ]),
      ),
    );
  }
}
