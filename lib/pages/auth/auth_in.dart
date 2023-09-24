import 'package:flutter/material.dart';

class AuthEnter extends StatefulWidget {
  const AuthEnter({super.key});

  @override
  State<AuthEnter> createState() => _AuthRegistrationState();
}

class _AuthRegistrationState extends State<AuthEnter> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            minimumSize: MaterialStateProperty.all(const Size(300, 50)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 2, 56, 4)),
            elevation: MaterialStateProperty.all(0),
            splashFactory: NoSplash.splashFactory),
        child: const Text(
          'Войти',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    ]);
  }
}
