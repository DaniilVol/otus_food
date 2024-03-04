import 'package:flutter/material.dart';
import 'package:otus_food/const/color_list.dart';
import 'package:otus_food/const/style.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/data/timer.dart';
import 'package:otus_food/models/ingredient_list_model.dart';
import 'package:otus_food/screens/info_recipes/ingredients_recipe_info.dart';
import 'package:otus_food/screens/info_recipes/step_recipes_info.dart';
import 'package:otus_food/widgets/button_dark_green.dart';
import 'package:otus_food/widgets/favorite_heart_widget.dart';
import 'package:otus_food/screens/info_recipes/comments.dart';
import 'package:provider/provider.dart';

// экран информация о рецепте

class InfoRecipes extends StatefulWidget {
  final OneRecipeIndex recipe;

  const InfoRecipes({required this.recipe, super.key});

  @override
  State<InfoRecipes> createState() => _InfoRecipesState();
}

class _InfoRecipesState extends State<InfoRecipes> {
  late bool startCooking;
  late TimerController allTimerController;

  @override
  void initState() {
    startCooking = false;
    allTimerController = AllTimeRecipes().allTimerController(widget.recipe);
    super.initState();
  }

  void onTapStartCooking() {
    startCooking = !startCooking;
    if (startCooking) {
      allTimerController = AllTimeRecipes().allTimerController(widget.recipe);
    } else {
      allTimerController.cancel();
    }
    setState(() {});
  }

  @override
  void dispose() {
    allTimerController.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white.color,
      appBar: AppBar(
        backgroundColor:
            startCooking ? ColorList.main.color : ColorList.white.color,
        iconTheme: IconThemeData(
          color: ColorList.black.color,
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              color: Colors.black,
              icon: const ImageIcon(AssetImage('assets/icons/megafon.png')),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        toolbarHeight: 60,
        title: Text(
          'Рецепт',
          style: startCooking
              ? TextStyle(color: ColorList.white.color)
              : TextStyle(color: ColorList.darkGreen.color),
        ),
        centerTitle: true,
        //backgroundColor: const Color.fromARGB(255, 216, 216, 216),
        //iconTheme: Theme.of(context).copyWith() ,
      ),
      body: ListView(children: [
        SafeArea(
            child: Column(
          children: [
            startCooking
                ? Container(
                    height: 59,
                    color: ColorList.main.color,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Таймер',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        StreamBuilder(
                            stream: allTimerController.timer,
                            initialData:
                                AllTimeRecipes().secondsToTime(widget.recipe),
                            builder: ((context, snapshot) => Text(
                                  snapshot.requireData,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900),
                                ))),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
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
                                widget.recipe.nameRecipes,
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
                              Text(widget.recipe.timeRecipes,
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
                        children: [FavoriteHeart(recipe: widget.recipe)],
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
                            widget.recipe.imgRecipes,
                            height: 220,
                            fit: BoxFit.cover,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 22.5,
                  ),
                  Row(
                    children: [
                      Text('Ингридиенты', style: Style.labelInfo.textStyle)
                    ],
                  ),
                  const SizedBox(height: 20),
                  ChangeNotifierProvider(
                    create: (context) => IngredientListProvider(
                        widget.recipe.ingredientName,
                        widget.recipe.ingredientValue),
                    child: IngredientsRecipeInfo(
                      recipe: widget.recipe,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Шаги приготовления',
                          style: Style.labelInfo.textStyle),
                    ],
                  ),
                  const SizedBox(height: 20),
                  StepRecipesInfo(
                      recipe: widget.recipe,
                      allTimerController: allTimerController,
                      startCooking: startCooking),
                  ButtonDarkGreen(
                      onPressed: onTapStartCooking,
                      text: startCooking
                          ? 'Закончить готовить'
                          : 'Начать готовить'),
                  const SizedBox(
                    height: 20,
                  ),
                  const PushComment(),
                ],
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
