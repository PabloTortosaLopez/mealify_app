import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/home/home.dart';

void main() {
  group('HomeCubit', () {
    test('default initial state is 0', () {
      expect(HomeCubit().state, 0);
    });

    blocTest<HomeCubit, int>(
      'changes the value with the new one',
      build: HomeCubit.new,
      act: (c) => c.desitinatinationSelected(1),
      expect: () => [1],
    );
  });
}
