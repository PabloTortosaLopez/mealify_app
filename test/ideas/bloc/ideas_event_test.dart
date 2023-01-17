import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/ideas/bloc/ideas_bloc.dart';

void main() {
  group('IdeasEvent', () {
    test('support value equality', () {
      final instanceA = ShowMeMorePressed();
      final instanceB = ShowMeMorePressed();
      expect(instanceA, instanceB);
    });
  });
}
