import 'package:flutter/material.dart';

class ATextBodyOne extends StatelessWidget {
  const ATextBodyOne({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.bodyText1!
          .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
