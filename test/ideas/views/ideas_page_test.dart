import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/ideas/bloc/ideas_bloc.dart';
import 'package:mealify_app/ideas/ideas.dart';
import 'package:mealify_ui/mealify_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:recipes_repository/recipes_repository.dart';

import '../../helpers/helpers.dart';

class MockIdeasBloc extends MockBloc<IdeasEvent, IdeasState>
    implements IdeasBloc {}

void main() {
  group('IdeasPage', () {
    testWidgets('renders IdeasView', (tester) async {
      await tester.pumpApp(const IdeasPage());
      expect(find.byType(IdeasView), findsOneWidget);
    });
  });

  group('IdeasView', () {
    late IdeasBloc ideasBloc;

    setUp(() {
      ideasBloc = MockIdeasBloc();
    });

    testWidgets(
        'renders loading indicator '
        'when ideas bloc is loading', (tester) async {
      when(() => ideasBloc.state).thenReturn(IdeasLoading());
      await tester.pumpApp(
        BlocProvider.value(
          value: ideasBloc,
          child: const IdeasView(),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    group('IdeasLoadFailed', () {
      testWidgets('renders error indicator', (tester) async {
        when(() => ideasBloc.state).thenReturn(IdeasFailure());
        await tester.pumpApp(
          BlocProvider.value(
            value: ideasBloc,
            child: const IdeasView(),
          ),
        );
        expect(find.byType(Icon), findsOneWidget);
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon && widget.icon == Icons.warning_amber_rounded,
          ),
          findsOneWidget,
        );
      });

      testWidgets('tapping show more adds a bloc event', (tester) async {
        when(() => ideasBloc.state).thenReturn(IdeasFailure());
        await tester.pumpApp(
          BlocProvider.value(
            value: ideasBloc,
            child: const IdeasView(),
          ),
        );
        await tester.tap(find.text('Reload'));
        await tester.pumpAndSettle();
        verify(() => ideasBloc.add(ShowMeMorePressed())).called(1);
      });
    });

    testWidgets('renders 2 IdeaCard when ideas load is succes', (tester) async {
      await mockNetworkImages(() async {
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
        when(() => ideasBloc.state)
            .thenReturn(IdeasSuccess.newPairing(pairing));
        await tester.pumpApp(
          BlocProvider.value(
            value: ideasBloc,
            child: const IdeasView(),
          ),
        );
        expect(find.byType(IdeaCard), findsNWidgets(2));
      });
    });

    group('Show me more button', () {
      testWidgets('tapping it adds the event ShowMeMorePressed to bloc',
          (tester) async {
        await mockNetworkImages(() async {
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
          when(() => ideasBloc.state)
              .thenReturn(IdeasSuccess.newPairing(pairing));
          await tester.pumpApp(
            BlocProvider.value(
              value: ideasBloc,
              child: const IdeasView(),
            ),
          );
          await tester.tap(find.text('Reload'));
          await tester.pumpAndSettle();
          verify(() => ideasBloc.add(ShowMeMorePressed())).called(1);
        });
      });
    });
  });
}
