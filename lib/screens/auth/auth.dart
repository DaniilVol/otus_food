import 'package:flutter/material.dart';
import 'package:otus_food/screens/auth/auth_in.dart';
import 'package:otus_food/screens/auth/auth_reg.dart';

// экран авторизации

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  bool accaunt = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2ECC71),
      body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(0, 100, 0, 25),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  accaunt ? const AuthEnter() : const AuthRegistration(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          clipBehavior: Clip.none,
                          onPressed: () {
                            setState(() {
                              accaunt = !accaunt;
                            });
                          },
                          style: const ButtonStyle(
                              splashFactory: InkSparkle.splashFactory),
                          child: accaunt
                              ? const Text('Зарегистрироваться',
                                  style: TextStyle(color: Colors.white))
                              : const Text(
                                  'Войти в приложение',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ],
                    ),
                  )
                ]),
          )),
    );
  }
}
