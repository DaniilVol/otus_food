import 'package:flutter/material.dart';
import 'package:otus_food/widgets/button_dark_green.dart';

class AuthRegistration extends StatefulWidget {
  const AuthRegistration({super.key});

  @override
  State<AuthRegistration> createState() => _AuthRegistrationState();
}

class _AuthRegistrationState extends State<AuthRegistration> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
                hintText: 'login',
                // labelText: 'text',
                fillColor: Colors.white,
                filled: true,
                // icon: Icon(Icons.person),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'password',
                // labelText: 'text',
                fillColor: Colors.white,
                filled: true,
                // icon: Icon(Icons.person),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'password',
                // labelText: 'text',
                fillColor: Colors.white,
                filled: true,
                // icon: Icon(Icons.person),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonDarkGreen(
          onPressed: () {},
          text: 'Зарегистрироваться',
        ),
      ],
    );
  }
}
