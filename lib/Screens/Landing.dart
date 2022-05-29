import 'package:flutter/material.dart';

import 'Login.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Login()));
    });
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/images/bg.png', fit: BoxFit.cover),
        Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ]),
    );
  }
}
