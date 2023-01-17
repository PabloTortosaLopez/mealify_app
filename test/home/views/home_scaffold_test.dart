import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_app/home/home.dart';
import 'package:mealify_app/ideas/ideas.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockHomeCubit extends MockCubit<int> implements HomeCubit {}

void main() {
  late HomeCubit homeCubit;

  setUp(() {
    homeCubit = MockHomeCubit();
  });

  group('HomeScaffold', () {
    testWidgets('renders IdeasPage when index is 0', (tester) async {
      when(() => homeCubit.state).thenReturn(0);
      await tester.pumpApp(
        BlocProvider.value(value: homeCubit, child: const HomeView()),
      );
      expect(find.byType(IdeasPage), findsOneWidget);
    });
  });
}
