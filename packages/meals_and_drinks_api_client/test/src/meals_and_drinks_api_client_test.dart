// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';

void main() {
  group('MealsAndDrinksApiClient', () {
    test('can be instantiated with the meals free api key', () {
      expect(MealsAndDrinksApiClient.mealsFree(), isNotNull);
    });

    test('can be instantiated with the drinks free api key', () {
      expect(MealsAndDrinksApiClient.drinksFree(), isNotNull);
    });
  });
}
