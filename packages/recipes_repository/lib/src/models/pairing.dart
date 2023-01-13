// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';
import 'package:recipes_repository/recipes_repository.dart';

class Pairing extends Equatable {
  const Pairing({
    required this.recipe,
    required this.cocktail,
  });

  factory Pairing.fromApi(Drinks drinks, Meals meals) {
    final cocktail = Cocktail.fromApi(drinks.drinks.first);
    final recipe = Recipe.fromApi(meals.meals.first);
    return Pairing(recipe: recipe, cocktail: cocktail);
  }

  final Recipe recipe;
  final Cocktail cocktail;

  @override
  List<Object?> get props => [
        recipe,
        cocktail,
      ];
}
