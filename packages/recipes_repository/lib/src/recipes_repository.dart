import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';
import 'package:recipes_repository/recipes_repository.dart';

/// {@template recipes_repository}
/// A repository to manage cocktails and meals API calls
/// {@endtemplate}
class RecipesRepository {
  /// {@macro recipes_repository}
  const RecipesRepository({
    required MealsAndDrinksApiClient mealsApiClient,
    required MealsAndDrinksApiClient drinksApiClient,
  })  : _mealsApiClient = mealsApiClient,
        _drinksApiClient = drinksApiClient;

  final MealsAndDrinksApiClient _mealsApiClient;

  final MealsAndDrinksApiClient _drinksApiClient;

  /// Returns a random [Pairing] each time, or throws either a
  /// [CouldNotFetchMealException] or a [CouldNotFetchDrinkException]
  /// if any of the API calls failed.
  Future<Pairing> getRandomPairing() async {
    try {
      final result = await Future.wait(
          [_drinksApiClient.getRandomDrink(), _mealsApiClient.getRandomMeal()]);
      final randomDrinks = result[0] as Drinks;
      final randomMeals = result[1] as Meals;
      return Pairing.fromApi(randomDrinks, randomMeals);
    } catch (_) {
      rethrow;
    }
  }

  /// Returns a random [Cocktail] each time, or throws
  /// a [CouldNotFetchDrinkException]  if the API call failed.
  Future<Cocktail> getRandomCocktail() async {
    try {
      final drinks = await _drinksApiClient.getRandomDrink();
      return Cocktail.fromApi(drinks.drinks.first);
    } catch (_) {
      rethrow;
    }
  }

  /// Returns a random [Recipe] each time, or throws a
  /// [CouldNotFetchMealException] if the API call failed.
  Future<Recipe> getRandomRecipe() async {
    try {
      final meals = await _mealsApiClient.getRandomMeal();
      return Recipe.fromApi(meals.meals.first);
    } catch (_) {
      rethrow;
    }
  }
}
