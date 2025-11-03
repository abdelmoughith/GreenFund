import 'package:flutter/material.dart';

/// Boutons verts réutilisables (remplis et contours) basés sur le thème.
///
/// Utilise `Theme.of(context).colorScheme.primary` pour la couleur principale
/// et ne hardcode aucune couleur. Préserve l'accessibilité via le contraste
/// par défaut du thème.
class GreenButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool outlined;
  final EdgeInsetsGeometry? padding;

  const GreenButton({super.key, required this.onPressed, required this.child, this.outlined = false, this.padding});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
    final resolvedPadding = padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24);

    if (outlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary, width: 1.5),
          shape: shape,
          padding: resolvedPadding,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child: child,
      );
    }

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: shape,
        padding: resolvedPadding,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: child,
    );
  }
}


