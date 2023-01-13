import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mealify_app/home/home.dart';
import 'package:mealify_app/l10n/l10n.dart';
import 'package:recipes_repository/recipes_repository.dart';

class App extends StatelessWidget {
  // ignore: use_super_parameters
  const App(
    this._recipesRepository, {
    Key? key,
  }) : super(key: key);

  final RecipesRepository _recipesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _recipesRepository),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        //home: const CounterPage(),
        home: const HomeScaffold(),
      ),
    );
  }
}
