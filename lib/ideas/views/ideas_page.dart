import 'package:flutter/material.dart';
import 'package:mealify_app/l10n/l10n.dart';

class IdeasPage extends StatelessWidget {
  const IdeasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const IdeasView();
  }
}

class IdeasView extends StatelessWidget {
  const IdeasView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: _IdeaCard(
              imageUrl:
                  'https://fra1.digitaloceanspaces.com/hundred-pro/media/web_header/burger-hero.7bb52c6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=IL4R4JH76EHIESLIHYRD%2F20230111%2Ffra1%2Fs3%2Faws4_request&X-Amz-Date=20230111T161923Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6354ccdb4126c41dcdc988a315f58d6d7b6aa62fd8f9d6f4e53132222553e638',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(l10n.reload),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => {},
                  child: Text(l10n.save),
                ),
              ],
            ),
          ),
          const Expanded(
            child: _IdeaCard(
              imageUrl:
                  'https://images.hola.com/imagenes/cocina/recetas/20190806147086/receta-batido-galletas-oreo-vainilla/0-707-944/recetas-postres-faciles-galletas-oreo-t.jpg?tx=w_1200',
            ),
          ),
        ],
      ),
    );
  }
}

// TODO(pablo): extract this widget to UI package
class _IdeaCard extends StatelessWidget {
  // ignore: use_super_parameters
  const _IdeaCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  /// Meal or Drink Image URL
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 550),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'title',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.lock_open,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
