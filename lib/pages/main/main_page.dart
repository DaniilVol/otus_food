import 'package:flutter/material.dart';
import 'package:otus_food/pages/favorites/favorites.dart';
import 'package:otus_food/pages/list_recipes/list_recipes.dart';
import 'package:otus_food/pages/auth/auth.dart';
import 'package:otus_food/pages/refrigerator/refrigerator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pages = [
    const ListRecipesWidget(),
    Refrigerator(),
    const FavoritesList(),
    const AuthWidget(),
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
          showUnselectedLabels: true,
          onTap: onTap,
          selectedItemColor: const Color(0xff2ECC71),
          unselectedItemColor: Colors.grey[600],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza),
              label: 'Рецепты',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stay_current_portrait_outlined),
              label: 'Холодильник',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Вход',
            ),
          ],
        ));
  }
}
