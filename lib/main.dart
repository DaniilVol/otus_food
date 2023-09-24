import 'package:flutter/material.dart';
import 'package:otus_food/pages/auth/auth.dart';
import 'package:otus_food/pages/auth/auth_reg.dart';
import 'package:otus_food/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(scaffoldBackgroundColor: const Color(0xFDCECEC6)),
      //Theme.of(context).copyWith(bottomNavigationBarTheme: Color(0xff2ECC71))
      //home: ListRecipes(),
      //initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        // '/infoRecipes': (context) => InfoRecipes(index),
        // '/log_enter': (context) => LogEnter(0),
        '/log_in': (context) => const AuthWidget(),
        '/log_reg': (context) => const AuthRegistration(),
      },
    );
  }
}
