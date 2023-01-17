import 'package:flutter/material.dart';

/// Renders a [ElevatedButton] with a title and a background color
/// that can be toggled
class IdeaActionButton extends StatelessWidget {
  /// {@macro action_button}
  const IdeaActionButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
  });

  /// Button CTA text
  final String title;

  /// Button background color
  final Color backgroundColor;

  /// Callback that triggers when the button is pressed
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
