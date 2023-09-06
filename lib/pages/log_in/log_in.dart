import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff2ECC71),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Вход',
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'OTUS.FOOD',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(),
            SizedBox(
              height: 30,
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
