import 'package:flutter/material.dart';

class AFloatingButton extends FloatingActionButton {
  const AFloatingButton({
    required super.child,
    required super.onPressed,
    super.key,
  });
  AFloatingButton.destructive({
    required super.child,
    required super.onPressed,
    required ThemeData theme,
    super.key,
  }) : super(
          backgroundColor: theme.colorScheme.secondary,
        );
}
