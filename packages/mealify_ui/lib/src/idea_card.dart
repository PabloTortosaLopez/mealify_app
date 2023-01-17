import 'package:flutter/material.dart';

/// Renders a [Card] with an image and a title
class IdeaCard extends StatelessWidget {
  /// {@macro idea_card}
  const IdeaCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  /// Meal or Drink image URL
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
