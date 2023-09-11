import 'package:flutter/material.dart';
import 'package:otus_food/pages/log_enter/log_in.dart';

class LogReg extends StatefulWidget {
  const LogReg({super.key});

  @override
  State<LogReg> createState() => _LogRegState();
}

class _LogRegState extends State<LogReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2ECC71),
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(90, 300, 90, 25),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Otus.Food',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
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
                        minimumSize:
                            MaterialStateProperty.all(const Size(300, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 2, 56, 4)),
                        elevation: MaterialStateProperty.all(0),
                        splashFactory: NoSplash.splashFactory),
                    child: const Text(
                      'Зарегистрироваться',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  clipBehavior: Clip.none,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const LogIn(), // можно ли так передавать в виджет параметры?
                    ));
                  },
                  style: const ButtonStyle(
                      splashFactory: InkSparkle.splashFactory),
                  child: const Text(
                    'Войти в приложение',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
