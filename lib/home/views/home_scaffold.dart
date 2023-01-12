import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealify_app/home/home.dart';
import 'package:mealify_app/ideas/ideas.dart';
import 'package:mealify_app/l10n/l10n.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<HomeCubit, int>(
      builder: (context, index) {
        return AdaptiveNavigationScaffold(
          appBar: AppBar(
            title: Text(l10n.mealify),
          ),
          body: index == 0 ? const IdeasPage() : Container(),
          selectedIndex: index,
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
          onDestinationSelected:
              context.read<HomeCubit>().desitinatinationSelected,
        );
      },
    );
  }
}
