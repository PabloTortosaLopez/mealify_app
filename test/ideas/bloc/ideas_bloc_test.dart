import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/ideas/bloc/ideas_bloc.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipes_repository/recipes_repository.dart';

class MockRecipesRepository extends Mock implements RecipesRepository {}

void main() {
  late RecipesRepository recipesRepository;

  const pairing = Pairing(
    cocktail: Cocktail(
      name: 'name',
      thumbnailUrl: 'thumbnailUrl',
      ingredients: <Ingredient>[],
    ),
    recipe: Recipe(
      name: 'name',
      thumbnailUrl: 'thumbnailUrl',
      ingredients: <Ingredient>[],
    ),
  );

  setUp(() {
    recipesRepository = MockRecipesRepository();
  });

  group('IdeasBloc', () {
    group('IdeasLoaded', () {
      blocTest<IdeasBloc, IdeasState>(
        'attempts to load a Paring, then emits [IdeasLoading, IdeasSuccess] '
        'when repository returns a Pairing',
        setUp: () {
          when(() => recipesRepository.getRandomPairing())
              .thenAnswer((_) async => pairing);
        },
        build: () => IdeasBloc(recipesRepository),
        act: (bloc) => bloc.add(IdeasLoaded()),
        expect: () => [IdeasLoading(), IdeasSuccess.newPairing(pairing)],
      );
      blocTest<IdeasBloc, IdeasState>(
        'attempts to load a Paring, then emits [IdeasLoading, IdeasFailure] '
        'when repository throws an error',
        setUp: () {
          when(() => recipesRepository.getRandomPairing())
              .thenThrow(CouldNotFetchMealException());
        },
        build: () => IdeasBloc(recipesRepository),
        act: (bloc) => bloc.add(IdeasLoaded()),
        expect: () => [IdeasLoading(), IdeasFailure()],
      );
    });

    group('ShowMeMorePressed', () {
      blocTest<IdeasBloc, IdeasState>(
        'attempts to reload a Paring, then emits [IdeasLoading, IdeasSuccess] '
        'when repository returns a Pairing',
        setUp: () {
          when(() => recipesRepository.getRandomPairing())
              .thenAnswer((_) async => pairing);
        },
        seed: () => const IdeasSuccess(pairing: pairing),
        build: () => IdeasBloc(recipesRepository),
        act: (bloc) => bloc.add(ShowMeMorePressed()),
        expect: () => [IdeasLoading(), IdeasSuccess.newPairing(pairing)],
      );

      blocTest<IdeasBloc, IdeasState>(
        'attempts to reload a Paring, then emits [IdeasLoading, IdeasFailure] '
        'when repository throws an error',
        setUp: () {
          when(() => recipesRepository.getRandomPairing())
              .thenThrow(CouldNotFetchMealException());
        },
        seed: () => const IdeasSuccess(pairing: pairing),
        build: () => IdeasBloc(recipesRepository),
        act: (bloc) => bloc.add(ShowMeMorePressed()),
        expect: () => [IdeasLoading(), IdeasFailure()],
      );
    });
  });
}
