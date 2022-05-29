import 'package:flutter/material.dart';
import 'package:news_app/Utls/Colors.dart';

import 'Login.dart';
import 'utalities.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Image.asset('assets/images/bg.png', fit: BoxFit.cover),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            Container(
              margin: const EdgeInsets.only(top: 23),
            ),
            const InputField(
              text: 'First Name',
              icon: Icons.person_outline,
              isPassword: false,
            ),
            const InputField(
              text: 'Last Name',
              icon: Icons.person_outline,
              isPassword: false,
            ),
            const InputField(
              text: 'Email Address',
              icon: Icons.email_outlined,
              isPassword: false,
            ),
            const InputField(
              text: 'Password',
              icon: Icons.lock_outlined,
              isPassword: true,
            ),
            const SubmitBtn(text: 'REGISTER'),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 60),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text(
                  " Login Now",
                  style: TextStyle(
                    color: MajorColoors.secondaryGolden,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
