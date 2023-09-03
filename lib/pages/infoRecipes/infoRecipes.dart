import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otus_food/pages/listRecipes/listRecipes.dart';

class InfoRecipes extends StatelessWidget {
  final int index;
  const InfoRecipes(this.index, {super.key});
  
  //var index = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Рецепт'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
        //iconTheme: Theme.of(context).copyWith() ,
      ),
      body: ListView( children: [SafeArea(minimum: EdgeInsets.fromLTRB(15, 0, 15, 0), child: 
          Column(children: [
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Flexible(child: Text(myRecipes[index].nameRecipes, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),)),
              SizedBox(height: 25,),
              ],),
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(Icons.access_time),
              SizedBox(width: 10,),
              Text(myRecipes[index].timeCook, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff2ECC71),)),
              ],),
            SizedBox(height: 15,),
            Row(children: [
              Flexible(fit: FlexFit.tight,  child: Image.asset(myRecipes[index].imgRecipes, height: 220, fit: BoxFit.cover,))
            ],),
            SizedBox(height: 22.5,),
            Row(children: [Text('Ингридиенты', style: TextStyle(fontSize: 16, color: Color(0xff165932))), ],),
            SizedBox(height: 19,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [Text('\u2022  Соевый соус\n\u2022  Вода\n\u2022  Мёд\n\u2022  Коричневый сахар\n\u2022  Чеснок \n\u2022  Тёртый свежий имбирь\n\u2022  Лимонный сок\n\u2022  Кукурузный крахмал\n\u2022  Растительное масло\n\u2022  Филе лосося или сёмги\n\u2022  Кунжут'),
              ],),
              Column( children: [Text('8 ст. ложек\n8 ст. ложек\n3 ст. ложки\n2 ст. ложки\n3 зубчика\n1 ст. ложка\n1¹⁄₂ ст. ложки\n1 ст. ложка\n1 ч. ложка\n680 г\nпо вкусу'),
              ],),
            ],),
            SizedBox(height: 19,),
            Row(children: [Text('Шаги приготовления', style: TextStyle(fontSize: 16, color: Color(0xff165932))), ],),
            SizedBox(height: 20,),
            Expanded(
                child: 
                  ListView.builder(scrollDirection: Axis.vertical, itemCount: StepRecipesSalmon.length, itemBuilder: (BuildContext context, int index) {
                    return Card(child: Row(children: [
                      Column(children: [
                        Flexible(child: Text('${index+1}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Color(0xffc2c2c2)),)),
                      ],),
                      Flexible(child: Column(children: [
                        Text(StepRecipesSalmon[index])])
                      ),
                      Column(children: [
                        Row(children: [Text('02:00')],),
                        Row(children: [Text('02:00')],),
                      ],)
                    ],),);
                  }),
                
              ),
          ],)

        ),]
      )
    );
  }
}