import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/data/timer.dart';
import 'package:otus_food/pages/info_recipes/ingredient_list.dart';
import 'package:otus_food/pages/info_recipes/step_recipes.dart';

import '../favorites/favorites_data.dart';

class AllTimeRecipes {
  TimerController allTimerController(index) {
    return TimerController(timeString: secondsToTime(index));
  }

  List<String> listTime(index) {
    return myRecipes[index].stepTimeRecipes;
  }

  String secondsToTime(index) {
    int seconds = timeToSeconds(index);
    int min = seconds ~/ 60;
    int sec = seconds - min * 60;
    return '${min < 10 ? '0$min' : min}:${sec < 10 ? '0$sec' : sec}';
  }

  int timeToSeconds(index) {
    int initialValue = 0;
    int seconds = 0;
    int allSeconds =
        listTime(index).fold<int>(initialValue, (previousValue, element) {
      List timeList = element.split(':');
      seconds = seconds + int.parse(timeList[0]) * 60 + int.parse(timeList[1]);
      return seconds;
    });
    return allSeconds;
  }
}

// экран

class InfoRecipes extends StatefulWidget {
  final int index;
  final TimerController allTimerController;

  InfoRecipes(this.index, {super.key})
      : allTimerController = AllTimeRecipes().allTimerController(index);

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
    } else {
      favoritesData.remove(widget.index);
      color = Colors.grey;
      setState(() {});
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
                        StreamBuilder(
                            stream: widget.allTimerController.timer,
                            initialData:
                                AllTimeRecipes().secondsToTime(widget.index),
                            builder: ((context, snapshot) =>
                                Text(snapshot.requireData))),
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
                      .map((e) => StepWidget(
                            stepData: e,
                            allTimerController: widget.allTimerController,
                          ))
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
