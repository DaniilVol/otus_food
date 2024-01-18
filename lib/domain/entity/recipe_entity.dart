import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecipeEntity {
  int id;
  String name;
  int duration;
  String photo;
  RecipeEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'duration': duration,
      'photo': photo,
    };
  }

  factory RecipeEntity.fromMap(Map<String, dynamic> map) {
    return RecipeEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      duration: map['duration'] as int,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeEntity.fromJson(String source) =>
      RecipeEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
