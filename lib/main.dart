import 'package:flutter/material.dart';
//import 'package:otus_food/pages/infoRecipes/infoRecipes.dart';
import 'package:otus_food/pages/log_in/log_in.dart';
import 'package:otus_food/pages/main_page.dart';

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
        //'/infoRecipes': (context) => InfoRecipes(index),
        '/log_in': (context) => const LogIn(),
      },
    );
  }
}
