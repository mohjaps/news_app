import 'package:flutter/material.dart';

import 'Register.dart';
import 'utalities.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
              text: 'Email Address',
              icon: Icons.email_outlined,
              isPassword: false,
            ),
            const InputField(
              text: 'Password',
              icon: Icons.lock_outlined,
              isPassword: true,
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 50),
              child: const Text(
                'Forget Password?',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color.fromARGB(255, 172, 120, 9),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SubmitBtn(text: 'LOGIN'),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 60),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                child: const Text(
                  "Register Now",
                  style: TextStyle(
                    color: Color.fromARGB(255, 172, 120, 9),
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
