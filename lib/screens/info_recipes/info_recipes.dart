import 'package:flutter/material.dart';
import 'package:otus_food/const/style.dart';
import 'package:otus_food/data/data_recipes.dart';
import 'package:otus_food/data/timer.dart';
import 'package:otus_food/models/ingredient_list_model.dart';
import 'package:otus_food/screens/info_recipes/ingredients_recipe_info.dart';
import 'package:otus_food/screens/info_recipes/step_recipes_info.dart';
import 'package:otus_food/widgets/favorite_heart_widget.dart';
import 'package:otus_food/screens/info_recipes/comments.dart';
import 'package:provider/provider.dart';

// экран информация о рецепте

class InfoRecipes extends StatefulWidget {
  final OneRecipeIndex recipe;
  final TimerController allTimerController;

  InfoRecipes({required this.recipe, super.key})
      : allTimerController = AllTimeRecipes().allTimerController(recipe);

  @override
  State<InfoRecipes> createState() => _InfoRecipesState();
}

class _InfoRecipesState extends State<InfoRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                                AllTimeRecipes().secondsToTime(widget.recipe),
                            builder: ((context, snapshot) =>
                                Text(snapshot.requireData))),
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
                    allTimerController: widget.allTimerController),
                const SizedBox(
                  height: 20,
                ),
                const PushComment(),
              ],
            ))
      ]),
    );
  }
}
