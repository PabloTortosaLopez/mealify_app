import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealify_app/ideas/bloc/ideas_bloc.dart';
import 'package:mealify_app/l10n/l10n.dart';
import 'package:mealify_ui/mealify_ui.dart';
import 'package:recipes_repository/recipes_repository.dart';

class IdeasPage extends StatelessWidget {
  const IdeasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IdeasBloc(
        context.read<RecipesRepository>(),
      )..add(IdeasLoaded()),
      child: const IdeasView(),
    );
  }
}

class IdeasView extends StatelessWidget {
  const IdeasView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdeasBloc, IdeasState>(
      builder: (context, state) {
        if (state is IdeasLoading) {
          return _IdeasLoading();
        } else if (state is IdeasSuccess) {
          return _IdeasSuccess(state: state);
        }

        return _IdeasFailure();
      },
    );
  }
}

class _IdeasSuccess extends StatelessWidget {
  // ignore: use_super_parameters
  const _IdeasSuccess({
    Key? key,
    required this.state,
  }) : super(key: key);

  final IdeasSuccess state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final recipe = state.pairing.recipe;
    final cocktail = state.pairing.cocktail;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IdeaCard(
              title: recipe.name,
              imageUrl: recipe.thumbnailUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IdeaActionButton(
                  title: l10n.reload,
                  backgroundColor: Colors.blue,
                  onPressed: () =>
                      context.read<IdeasBloc>().add(const ShowMeMorePressed()),
                ),
                IdeaActionButton(
                  title: l10n.save,
                  backgroundColor: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: IdeaCard(
              title: cocktail.name,
              imageUrl: cocktail.thumbnailUrl,
            ),
          ),
        ],
      ),
    );
  }
}

class _IdeasFailure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_rounded, size: 75, color: Colors.red),
          Text(
            l10n.somethingWentWrong,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          IdeaActionButton(
            title: l10n.reload,
            backgroundColor: Colors.blue,
            onPressed: () =>
                context.read<IdeasBloc>().add(const ShowMeMorePressed()),
          ),
        ],
      ),
    );
  }
}

class _IdeasLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
