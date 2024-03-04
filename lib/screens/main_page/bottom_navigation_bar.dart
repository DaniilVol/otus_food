import 'package:flutter/material.dart';
import 'package:otus_food/const/color_list.dart';
import 'package:otus_food/screens/favorites/favorites.dart';
import 'package:otus_food/screens/list_recipes/list_recipes.dart';
import 'package:otus_food/screens/auth/auth.dart';
import 'package:otus_food/screens/refrigerator/refrigerator.dart';

// экран начальная страница

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final List _pages = [
    const ListRecipesWidget(),
    const Refrigerator(),
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
          selectedItemColor: ColorList.main.color,
          unselectedItemColor: ColorList.gray.color,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/pizza.png'),
              ),
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
              icon: ImageIcon(
                AssetImage('assets/icons/user.png'),
              ),
              label: 'Вход',
            ),
          ],
        ));
  }
}
