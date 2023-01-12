import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';

/// {@template meals_and_drinks_api_client}
/// A client to perform meals and drinks API calls
/// {@endtemplate}
class MealsAndDrinksApiClient {
  /// {@macro meals_and_drinks_api_client}
  MealsAndDrinksApiClient(this._dio);

  /// Creates a client with the free/test meals API key
  factory MealsAndDrinksApiClient.mealsFree() => MealsAndDrinksApiClient(
        Dio(
          BaseOptions(baseUrl: 'https://www.themealdb.com/api/json/v1/1'),
        ),
      );

  /// Creates a client with the free/test drinks API key
  factory MealsAndDrinksApiClient.drinksFree() => MealsAndDrinksApiClient(
        Dio(
          BaseOptions(baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1'),
        ),
      );

  final Dio _dio;

  /// If the API call is successful, it will return a random [Meal] each time.
  /// Otherwise, it will throw a [CouldNotFetchMealException].
  Future<Meals> getRandomMeal() async {
    try {
      final response = await _dio.get<String>('/random.php');
      return Meals.fromJson(jsonDecode(response.data!) as Map<String, dynamic>);
    } catch (_) {
      throw CouldNotFetchMealException();
    }
  }

  /// If the API call is successful, it will return a random [Drink] each time.
  /// Otherwise, it will throw a [CouldNotFetchDrinkException].
  Future<Drinks> getRandomDrink() async {
    try {
      final response = await _dio.get<String>('/random.php');
      return Drinks.fromJson(
        jsonDecode(response.data!) as Map<String, dynamic>,
      );
    } catch (_) {
      throw CouldNotFetchDrinkException();
    }
  }
}
