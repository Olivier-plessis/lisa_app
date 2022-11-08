import 'package:flutter/material.dart';

class AButton extends ElevatedButton {
  const AButton({
    required super.child,
    required super.onPressed,
    super.key,
  });
  const AButton.destructive({
    required super.child,
    required super.onPressed,
    required ThemeData theme,
    super.key,
  }) : super();
}
