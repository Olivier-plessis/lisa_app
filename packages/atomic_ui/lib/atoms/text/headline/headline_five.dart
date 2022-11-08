import 'package:flutter/material.dart';

class ATextHeadlineFive extends StatelessWidget {
  const ATextHeadlineFive({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.headline5!
          .copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }
}
