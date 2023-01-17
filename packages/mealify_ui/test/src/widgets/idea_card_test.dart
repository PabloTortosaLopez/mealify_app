import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_ui/src/widgets.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group(
    'IdeaCard',
    () {
      testWidgets('renders a Card with title, image and a open lock',
          (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: IdeaCard(
                title: 'Title',
                imageUrl: 'url',
              ),
            ),
          );
          expect(find.byType(Card), findsOneWidget);
          expect(find.byType(Image), findsOneWidget);
          expect(find.text('Title'), findsOneWidget);
          expect(find.byIcon(Icons.lock_open), findsOneWidget);
        });
      });
    },
  );
}
