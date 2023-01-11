import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:mealify_app/l10n/l10n.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdaptiveNavigationScaffold(
      appBar: AppBar(
        title: Text(l10n.mealify),
      ),
      // selectedIndex: index,
      // body: index == 0 ? const IdeasPage() : const FavoritesPage(),
      selectedIndex: 0,
      body: Container(),
      destinations: [
        AdaptiveScaffoldDestination(
          title: l10n.ideas,
          icon: Icons.lightbulb_outline_rounded,
        ),
        AdaptiveScaffoldDestination(
          title: l10n.favorites,
          icon: Icons.favorite_border_rounded,
        ),
      ],
      // onDestinationSelected:
      //   context.read<HomeCubit>().desitinatinationSelected,
    );
  }
}
