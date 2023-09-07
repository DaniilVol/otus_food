import 'package:flutter/material.dart';
import 'package:otus_food/pages/list_recipes/list_recipes.dart';
import 'package:otus_food/pages/log_in/log_in.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  List pages = [
    ListRecipes(),
    LogIn(),
  ];

  int currentIndex = 0;
  void OnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        // int _selextedIndex = 0
        //backgroundColor: Color(0xffececec6),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: OnTap,
          selectedItemColor: const Color(0xff2ECC71),
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
        ));
  }
}
