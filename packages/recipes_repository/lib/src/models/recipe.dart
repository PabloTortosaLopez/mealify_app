// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';
import 'package:recipes_repository/recipes_repository.dart';
import 'package:recipes_repository/src/helpers/helpers.dart';

class Recipe extends Equatable {
  const Recipe({
    required this.name,
    required this.thumbnailUrl,
    required this.ingredients,
  });

  factory Recipe.fromApi(Meal meal) => Recipe(
        name: meal.strMeal,
        thumbnailUrl: meal.strMealThumb,
        ingredients: meal.ingredients(),
      );

  final String name;
  final String thumbnailUrl;
  final List<Ingredient> ingredients;

  @override
  @override
  List<Object?> get props => [
        name,
        thumbnailUrl,
        ingredients,
      ];
}

extension on Meal {
  List<Ingredient> ingredients() {
    final ingredients = <Ingredient>[];
    if (areNotNullNorEmpty(strIngredient1, strMeasure1)) {
      ingredients
          .add(Ingredient(name: strIngredient1!, quantity: strMeasure1!));
    }
    if (areNotNullNorEmpty(strIngredient2, strMeasure2)) {
      ingredients
          .add(Ingredient(name: strIngredient2!, quantity: strMeasure2!));
    }
    if (areNotNullNorEmpty(strIngredient3, strMeasure3)) {
      ingredients
          .add(Ingredient(name: strIngredient3!, quantity: strMeasure3!));
    }
    if (areNotNullNorEmpty(strIngredient4, strMeasure4)) {
      ingredients
          .add(Ingredient(name: strIngredient4!, quantity: strMeasure4!));
    }
    if (areNotNullNorEmpty(strIngredient5, strMeasure5)) {
      ingredients
          .add(Ingredient(name: strIngredient5!, quantity: strMeasure5!));
    }
    if (areNotNullNorEmpty(strIngredient6, strMeasure6)) {
      ingredients
          .add(Ingredient(name: strIngredient6!, quantity: strMeasure6!));
    }
    if (areNotNullNorEmpty(strIngredient7, strMeasure7)) {
      ingredients
          .add(Ingredient(name: strIngredient7!, quantity: strMeasure7!));
    }
    if (areNotNullNorEmpty(strIngredient8, strMeasure8)) {
      ingredients
          .add(Ingredient(name: strIngredient8!, quantity: strMeasure8!));
    }
    if (areNotNullNorEmpty(strIngredient9, strMeasure9)) {
      ingredients
          .add(Ingredient(name: strIngredient9!, quantity: strMeasure9!));
    }
    if (areNotNullNorEmpty(strIngredient10, strMeasure10)) {
      ingredients
          .add(Ingredient(name: strIngredient10!, quantity: strMeasure10!));
    }
    if (areNotNullNorEmpty(strIngredient11, strMeasure11)) {
      ingredients
          .add(Ingredient(name: strIngredient11!, quantity: strMeasure11!));
    }
    if (areNotNullNorEmpty(strIngredient12, strMeasure12)) {
      ingredients
          .add(Ingredient(name: strIngredient12!, quantity: strMeasure12!));
    }
    if (areNotNullNorEmpty(strIngredient13, strMeasure13)) {
      ingredients
          .add(Ingredient(name: strIngredient13!, quantity: strMeasure13!));
    }
    if (areNotNullNorEmpty(strIngredient14, strMeasure14)) {
      ingredients
          .add(Ingredient(name: strIngredient14!, quantity: strMeasure14!));
    }
    if (areNotNullNorEmpty(strIngredient15, strMeasure15)) {
      ingredients
          .add(Ingredient(name: strIngredient15!, quantity: strMeasure15!));
    }
    if (areNotNullNorEmpty(strIngredient16, strMeasure16)) {
      ingredients
          .add(Ingredient(name: strIngredient16!, quantity: strMeasure16!));
    }
    if (areNotNullNorEmpty(strIngredient17, strMeasure17)) {
      ingredients
          .add(Ingredient(name: strIngredient17!, quantity: strMeasure17!));
    }
    if (areNotNullNorEmpty(strIngredient18, strMeasure18)) {
      ingredients
          .add(Ingredient(name: strIngredient18!, quantity: strMeasure18!));
    }
    if (areNotNullNorEmpty(strIngredient19, strMeasure19)) {
      ingredients
          .add(Ingredient(name: strIngredient19!, quantity: strMeasure19!));
    }
    if (areNotNullNorEmpty(strIngredient20, strMeasure20)) {
      ingredients
          .add(Ingredient(name: strIngredient20!, quantity: strMeasure20!));
    }
    return ingredients;
  }
}
