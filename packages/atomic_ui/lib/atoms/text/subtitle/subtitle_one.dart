import 'package:flutter/material.dart';

class ATextSubTitlePrimary extends StatelessWidget {
  const ATextSubTitlePrimary({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.subtitle1!
          .copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }
}
