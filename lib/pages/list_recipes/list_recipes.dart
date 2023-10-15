// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:otus_food/data/data_recipes.dart';

import '../info_recipes/info_recipes.dart';

class ListRecipesWidget extends StatelessWidget {
  const ListRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: myRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: OneRecipesWidget(
                recipe: OneRecipeIndex(index: index),
              ),
            );
          }),
    );
  }
}

class OneRecipesWidget extends StatelessWidget {
  final OneRecipeIndex recipe;
  const OneRecipesWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InfoRecipes(
                recipe: recipe), // можно ли так передавать в виджет параметры?
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
                      recipe.imgRecipes,
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
                    Text(recipe.nameRecipesShort,
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
                          recipe.timeRecipes,
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
        ));
  }
}
