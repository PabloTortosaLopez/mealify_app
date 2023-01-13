// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';
import 'package:recipes_repository/recipes_repository.dart';

void main() {
  group('RecipesRepository', () {
    test('can be instantiated', () {
      expect(
        RecipesRepository(
          drinksApiClient: MealsAndDrinksApiClient.drinksFree(),
          mealsApiClient: MealsAndDrinksApiClient.mealsFree(),
        ),
        isNotNull,
      );
    });
  });
}
