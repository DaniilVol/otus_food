import 'package:hive_flutter/hive_flutter.dart';

void hive() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Hive.initFlutter();
  var ingredientRefrigeratorHive =
      await Hive.openBox<List<String>>('ingredientRefrigerator');
  if (ingredientRefrigeratorHive.isEmpty) {
    await ingredientRefrigeratorHive.put('ingredientName', [
      'Соевый соус',
      'Вода',
      'Мёд',
      'Коричневый сахар',
      'Чеснок',
    ]);
    await ingredientRefrigeratorHive.put('ingredientValue', [
      '8 ст. ложек',
      '8 ст. ложек',
      '3 ст. ложки',
      '2 ст. ложки',
    ]);
  }
  ingredientRefrigeratorHive.close();

  //await ingredientRefrigeratorHive.deleteFromDisk();
}
