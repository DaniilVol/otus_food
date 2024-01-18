import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:otus_food/domain/entity/recipe_entity.dart';

class ApiRecipes {
  final client = http.Client();

  Future<List<RecipeEntity>> getListRecipes() async {
    final url = Uri.parse('https://foodapi.dzolotov.tech/recipe');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      print(json);
      final recipes = json.map((e) => RecipeEntity.fromMap(e)).toList();
      print(recipes);
      return recipes;
    } else {
      throw Exception('Failed to load');
    }
  }
}
