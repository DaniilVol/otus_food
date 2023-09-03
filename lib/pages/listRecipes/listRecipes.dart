import 'package:flutter/material.dart';

import '../infoRecipes/infoRecipes.dart';

//import '../resources/resources.dart';

List<Recipes> myRecipes = [
Recipes(nameRecipes: 'Лосось в соусе терияки', timeCook: '45 минут', imgRecipes: 'assets/img/salmon.jpg'),
Recipes(nameRecipes: 'Поке боул с сыром тофу', timeCook: '30 минут', imgRecipes: 'assets/img/poke.jpeg'),
Recipes(nameRecipes: 'Стейк из говядины по-грузински с картошкой', timeCook: '1 час 15 минут', imgRecipes: 'assets/img/steak.jpg'),
Recipes(nameRecipes: 'Тосты с голубикой и бананом', timeCook: '45 минут', imgRecipes: 'assets/img/toast.jpg'),
Recipes(nameRecipes: 'Паста с морепродуктами', timeCook: '25 минут', imgRecipes: 'assets/img/pasta.jpg'),
Recipes(nameRecipes: 'Бургер с двумя котлетами', timeCook: '1 час', imgRecipes: 'assets/img/burger.jpg'),
Recipes(nameRecipes: 'Пицца Маргарита домашняя',  timeCook : '25 минут', imgRecipes: 'assets/img/pizza.jpg'),
];

class Recipes {
  final String nameRecipes;
  final String timeCook;
  final String imgRecipes;

  /* String get nameRecipe => _nameRecipes;

  set nameRecipe (String name){
    if (name.length > 5) {
      _nameRecipes = name.characters.take(5);
      return _nameRecipes;
    }
  } */

  Recipes({
    required this.nameRecipes,
    required this.timeCook,
    required this.imgRecipes,
  }) ; //:  _nameRecipes = 'text';

  
  //void set nameRecipe(String nameRecipes) => (nameRecipes.length > 5) ? (_nameRecipes = (nameRecipes.characters.take(5).toString()) + '...') : _nameRecipes = 'nameRecipes';
}

List StepRecipesSalmon = <String>[
'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
];



class ListRecipes extends StatefulWidget {
  const ListRecipes({super.key});

  @override
  State<ListRecipes> createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipes> {
  
  /* void _onRecipeTap(int index) {
    var id = _recipes[index].id;
    if (id == 1) {
      Navigator.pushNamed(context, '/recipeInfo');
    } else if (id == 2) {
      Navigator.pushNamed(context, '/recipeInfoPokeboul');
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffececec6),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff2ECC71),
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
      ),
      body: ListView.builder(itemCount: myRecipes.length, itemBuilder: (BuildContext context, int index) {
        final recipeImg = myRecipes[index].imgRecipes;
        final recipeTime = myRecipes[index].timeCook;
        String name = myRecipes[index].nameRecipes;
        final recipeName = (name.length > 32) ? '${name.characters.take(32)}...' : (name);
        return SafeArea(minimum: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          child: InkWell(
          //borderRadius: BorderRadius.circular(10),  
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {print(index);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoRecipes(index),
              )
            );
          }, 
          child: Card(elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
            
              ), child: Row( children: [
              Column( children: [
                Image.asset(recipeImg, width: 149, height: 136, fit: BoxFit.cover,),
              ],),
              SizedBox(width: 16,),
              Flexible( child: 
                Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(recipeName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500 )),
                    SizedBox(height: 10,),
                    Row( children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 15,),
                      Text(recipeTime, style: TextStyle(color: Color(0xff2ECC71)),),
                    ],),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              
            ],),
            
            
            
          )));
        
          
        
        
        
             /*  ListTile( 
                onTap: () {},
                tileColor: Color(0xFFFF00000),
                leading: Image.asset(recipeImg, width: 149, height: 136, fit: BoxFit.cover,),
                title: Text(recipeName),
                subtitle: Row(children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 20,),
                  Text(recipeTime),
                   ],),
            ); */
          
        
          
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
                                recipes.timeCook,
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