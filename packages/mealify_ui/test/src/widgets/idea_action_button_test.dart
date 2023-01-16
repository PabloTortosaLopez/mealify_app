import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_ui/mealify_ui.dart';

void main() {
  group(
    'IdeaActionButton',
    () {
      testWidgets('renders an ElevatedButton with title and background color',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: IdeaActionButton(
              title: 'Title',
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
          ),
        );
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.byType(Text), findsOneWidget);
        expect(find.text('Title'), findsOneWidget);
        expect(
          ((tester.firstWidget(find.byType(ElevatedButton)) as ElevatedButton)
                  .style!)
              .backgroundColor!
              .resolve(<MaterialState>{}),
          Colors.red,
        );
      });
    },
  );
}
