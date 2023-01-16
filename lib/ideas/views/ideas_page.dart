import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealify_app/ideas/bloc/ideas_bloc.dart';
import 'package:mealify_app/l10n/l10n.dart';
import 'package:recipes_repository/recipes_repository.dart';

class IdeasPage extends StatelessWidget {
  const IdeasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IdeasBloc(
        context.read<RecipesRepository>(),
      )..add(LoadIdeas()),
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
            child: _IdeaCard(
              title: recipe.name,
              imageUrl: recipe.thumbnailUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ShowMeMoreButton(
                  onPressed: () =>
                      context.read<IdeasBloc>().add(const ShowMeMorePressed()),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: Text(l10n.save),
                ),
              ],
            ),
          ),
          Expanded(
            child: _IdeaCard(
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
          _ShowMeMoreButton(
            onPressed: () =>
                context.read<IdeasBloc>().add(const ShowMeMorePressed()),
          ),
        ],
      ),
    );
  }
}

// TODO(pablo): extract this widget to UI package
class _ShowMeMoreButton extends StatelessWidget {
  // ignore: use_super_parameters
  const _ShowMeMoreButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(l10n.reload),
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

// TODO(pablo): extract this widget to UI package
class _IdeaCard extends StatelessWidget {
  // ignore: use_super_parameters
  const _IdeaCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  /// Meal or Drink Image URL
  final String imageUrl;

  /// Card title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.lock_open,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
