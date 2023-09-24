import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/pages/info_recipes/ingredient_list.dart';
import 'package:otus_food/pages/info_recipes/step_recipes.dart';

import '../favorites/favorites_data.dart';

// экран

class InfoRecipes extends StatefulWidget {
  final int index;
  const InfoRecipes(this.index, {super.key});

  @override
  State<InfoRecipes> createState() => _InfoRecipesState();
}

class _InfoRecipesState extends State<InfoRecipes> {
  @override
  void initState() {
    favoriteState();
    super.initState();
  }

  MaterialColor? color;
  bool favoriteRecipe = false;

  void favoriteState() {
    for (int ithem in favoritesData) {
      if (myRecipes[ithem] == myRecipes[widget.index]) {
        color = Colors.red;
        favoriteRecipe = true;
        break;
      } else {
        color = Colors.grey;
        favoriteRecipe = false;
      }
    }
  }

  void onTapFavorite() {
    favoriteRecipe = !favoriteRecipe;
    if (favoriteRecipe) {
      favoritesData.add(widget.index);
      color = Colors.red;
      setState(() {});
      print(favoritesData);
    } else {
      favoritesData.remove(widget.index);
      color = Colors.grey;
      setState(() {});
      print(favoritesData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('Рецепт'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
        //iconTheme: Theme.of(context).copyWith() ,
      ),
      body: ListView(children: [
        SafeArea(
            minimum: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              myRecipes[widget.index].nameRecipes,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(myRecipes[widget.index].timeRecipes,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff2ECC71),
                                )),
                          ],
                        ),
                      ],
                    )),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => onTapFavorite(),
                            icon: Icon(
                              Icons.favorite,
                              size: 40,
                              color: color,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Image.asset(
                          myRecipes[widget.index].imgRecipes,
                          height: 220,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 22.5,
                ),
                const Row(
                  children: [
                    Text('Ингридиенты',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff165932))),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.red),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: IngredientListWidget(
                          listNameIngredient:
                              myRecipes[widget.index].ingredientName,
                          listValueIngredient:
                              myRecipes[widget.index].ingredientValue),
                    )),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text('Шаги приготовления',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff165932))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: ListStepData(
                          index: widget
                              .index) // передаем индекс выбранного рецепта для создания списка виджетов шагов рецепта
                      .listStepData
                      .map((e) => StepWidget(stepData: e))
                      .toList(),
                ),
                const SizedBox(
                  height: 40,
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
                    'Начать готовить',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
