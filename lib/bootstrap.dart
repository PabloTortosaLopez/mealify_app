import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';
import 'package:recipes_repository/recipes_repository.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

typedef AppBuilder = FutureOr<Widget> Function(
  RecipesRepository recipesRepository,
);

Future<void> bootstrap(AppBuilder builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  final mealApiClient = MealsAndDrinksApiClient.mealsFree();
  final cocktailApiClient = MealsAndDrinksApiClient.drinksFree();

  final recipesRepository = RecipesRepository(
    mealsApiClient: mealApiClient,
    drinksApiClient: cocktailApiClient,
  );

  await runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();
      return runApp(
        await builder(recipesRepository),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
