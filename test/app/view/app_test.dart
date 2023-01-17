import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/app/app.dart';
import 'package:mealify_app/home/views/home_scaffold.dart';
import 'package:mealify_app/ideas/ideas.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipes_repository/recipes_repository.dart';

class MockRecipesRepository extends Mock implements RecipesRepository {}

void main() {
  group('App', () {
    testWidgets('renders HomeScaffold and IdeasPage', (tester) async {
      await tester.pumpWidget(
        App(
          MockRecipesRepository(),
        ),
      );
      expect(find.byType(HomeScaffold), findsOneWidget);
      expect(find.byType(IdeasPage), findsOneWidget);
    });
  });
}
