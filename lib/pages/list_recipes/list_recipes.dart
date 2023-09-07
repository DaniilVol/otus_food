import 'package:flutter/material.dart';
import 'package:otus_food/data/data.dart';
import 'package:otus_food/pages/log_in/log_in.dart';

import '../info_recipes/info_recipes.dart';

//import '../resources/resources.dart';

class ListRecipes extends StatefulWidget {
  const ListRecipes({super.key});

  @override
  State<ListRecipes> createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* // int _selextedIndex = 0
      //backgroundColor: Color(0xffececec6),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: ,
        onTap: (_) {},
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
        //currentIndex: _selectedIndex,
        //onTap: _onItemTapped,
      ), */
      body: ListView.builder(
          itemCount: myRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            final recipeImg = myRecipes[index].imgRecipes;
            final recipeTime = myRecipes[index].timeRecipes;
            String name = myRecipes[index].nameRecipes;
            final recipeName =
                (name.length > 32) ? '${name.characters.take(32)}...' : (name);
            return SafeArea(
                minimum: const EdgeInsets.fromLTRB(16, 15, 16, 0),
                child: InkWell(
                    //borderRadius: BorderRadius.circular(10),
                    //splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print(index);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InfoRecipes(index),
                      ));
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                recipeImg,
                                width: 149,
                                height: 136,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(recipeName,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      recipeTime,
                                      style:
                                          TextStyle(color: Color(0xff2ECC71)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )));
          }),

      /* Stack(children: [
        Container(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(padding: EdgeInsets.only(top: 24));
              },
              itemCount: myRecipes.length,
              itemBuilder: (BuildContext context, int index) {
                {
                  final recipes = myRecipes[index];
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 396,
                      height: 136,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(recipes.imgRecipes),
                              width: 149,
                              height: 136,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 165, top: 30),
                            child: SizedBox(
                              width: 208,
                              child: Text(
                                recipes.nameRecipes,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 95, left: 165),
                            child: Icon(
                              Icons.watch_later_outlined,
                              size: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 94, left: 192),
                            child: SizedBox(
                              height: 19,
                              child: Text(
                                recipes.timeRecipes,
                                style: const TextStyle(
                                    color: Color(0xff2ECC71), fontSize: 16),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => (index),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          
        ),
      ]), */
    );
  }
}
