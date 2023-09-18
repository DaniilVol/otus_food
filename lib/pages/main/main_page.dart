import 'package:flutter/material.dart';
import 'package:otus_food/pages/list_recipes/list_recipes.dart';
import 'package:otus_food/pages/log_enter/log_in.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pages = [
    const ListRecipes(),
    const LogIn(),
  ];

  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTap,
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
