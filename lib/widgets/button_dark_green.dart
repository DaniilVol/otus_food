import 'package:flutter/material.dart';

class ButtonDarkGreen extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const ButtonDarkGreen(
      {required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          minimumSize: MaterialStateProperty.all(const Size(300, 50)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 2, 56, 4)),
          elevation: MaterialStateProperty.all(0),
          splashFactory: NoSplash.splashFactory),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
