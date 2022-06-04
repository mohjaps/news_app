import 'package:flutter/material.dart';
import 'package:news_app/Utls/Colors.dart';

import '../Models/User.dart';
import '../Services/auth.dart';
import 'Home.dart';
import 'Login.dart';
import 'utalities.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    void RegisterUser() {
      User model = User.Register(
          _emailController.text,
          _firstNameController.text,
          _lastNameController.text,
          _passwordController.text);

      Auth.register(model).then((value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else {
          print('error');
        }
      });
    }

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
            InputField(
              controller: _firstNameController,
              text: 'First Name',
              icon: Icons.person_outline,
              isPassword: false,
            ),
            InputField(
              controller: _lastNameController,
              text: 'Last Name',
              icon: Icons.person_outline,
              isPassword: false,
            ),
            InputField(
              controller: _emailController,
              text: 'Email Address',
              icon: Icons.email_outlined,
              isPassword: false,
            ),
            InputField(
              controller: _passwordController,
              text: 'Password',
              icon: Icons.lock_outlined,
              isPassword: true,
            ),
            SubmitBtn(text: 'REGISTER', submitBTN: RegisterUser),
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
