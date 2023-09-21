import 'package:flutter/material.dart';
import 'package:otus_food/data/data_recipes.dart';
import '../info_recipes/info_recipes.dart';

class ListRecipesWidget extends StatefulWidget {
  const ListRecipesWidget({super.key});

  @override
  State<ListRecipesWidget> createState() => _ListRecipesWidgetState();
}

class _ListRecipesWidgetState extends State<ListRecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: myRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            final recipeImg = myRecipes[index].imgRecipes;
            final recipeTime = myRecipes[index].timeRecipes;
            String name = myRecipes[index].nameRecipes;
            final recipeName =
                (name.length > 32) ? '${name.characters.take(32)}...' : (name);
            return OneRecipesWidget(
              recipeImg: recipeImg,
              recipeName: recipeName,
              recipeTime: recipeTime,
              index: index,
            );
          }),
    );
  }
}

class OneRecipesWidget extends StatelessWidget {
  const OneRecipesWidget({
    super.key,
    required this.recipeImg,
    required this.recipeName,
    required this.recipeTime,
    required this.index,
  });

  final String recipeImg;
  final String recipeName;
  final String recipeTime;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 15, 16, 0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InfoRecipes(
                    index), // можно ли так передавать в виджет параметры?
              ));
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.asset(
                          recipeImg,
                          width: 149,
                          height: 136,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(recipeName,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              recipeTime,
                              style: const TextStyle(color: Color(0xff2ECC71)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
