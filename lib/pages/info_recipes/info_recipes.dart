import 'package:flutter/material.dart';
import 'package:otus_food/data/data.dart';
import 'package:otus_food/pages/info_recipes/step_recipes.dart';

class InfoRecipes extends StatefulWidget {
  final int index;
  const InfoRecipes(this.index, {super.key});

  @override
  State<InfoRecipes> createState() => _InfoRecipesState();
}

class _InfoRecipesState extends State<InfoRecipes> {
  //var index = index;
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
            minimum: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                      myRecipes[widget.index].nameRecipes,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 19,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                            '\u2022  Соевый соус\n\u2022  Вода\n\u2022  Мёд\n\u2022  Коричневый сахар\n\u2022  Чеснок \n\u2022  Тёртый свежий имбирь\n\u2022  Лимонный сок\n\u2022  Кукурузный крахмал\n\u2022  Растительное масло\n\u2022  Филе лосося или сёмги\n\u2022  Кунжут'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                            '8 ст. ложек\n8 ст. ложек\n3 ст. ложки\n2 ст. ложки\n3 зубчика\n1 ст. ложка\n1¹⁄₂ ст. ложки\n1 ст. ложка\n1 ч. ложка\n680 г\nпо вкусу'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
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
                allStep(),
              ],
            ))
      ]),
    );
  }
}
