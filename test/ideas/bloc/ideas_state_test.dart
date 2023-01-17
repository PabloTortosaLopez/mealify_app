import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/ideas/bloc/ideas_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipes_repository/recipes_repository.dart';

class MockPairing extends Mock implements Pairing {}

void main() {
  group('IdeasState', () {
    test('support value equality', () {
      expect(IdeasLoading(), equals(IdeasLoading()));
    });

    group('copyWith', () {
      test('updates values', () {
        final initialMockPairing = MockPairing();
        final mockPairing = MockPairing();
        expect(
          IdeasSuccess(
            pairing: initialMockPairing,
          )
              .copyWith(
                pairing: mockPairing,
              )
              .pairing,
          equals(mockPairing),
        );
      });

      test('keeps the old value if the new value is null', () {
        final initialMockPairing = MockPairing();
        expect(
          IdeasSuccess(
            pairing: initialMockPairing,
          ).copyWith().pairing,
          equals(initialMockPairing),
        );
      });
    });
  });
}
