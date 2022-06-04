import 'package:flutter/material.dart';
import 'package:news_app/Utls/Colors.dart';
import '../Models/User.dart';
import '../Services/auth.dart';
import 'Home.dart';
import 'Register.dart';
import 'utalities.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    void LobinUser() {
      User model = User.Login(_emailController.text, _passwordController.text);
      if (_emailController.text != null || _passwordController != null) {
        Auth.login(model)
            .then((value) {
          if (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else {
            print('error');
          }
        });
      } else {
        print('Empty Values Isn\'t Allowed');
      }
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
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 50),
              child: const Text(
                'Forget Password?',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: MajorColoors.secondaryGolden,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SubmitBtn(text: 'LOGIN', submitBTN: LobinUser),
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
