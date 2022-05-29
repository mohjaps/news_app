// Input Field
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPassword;

  const InputField(
      {Key? key,
      required this.text,
      required this.icon,
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
  const SubmitBtn({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Color.fromARGB(255, 236, 183, 191),
              minimumSize: Size.infinite)),
    );
  }
}
