import 'package:flutter/material.dart';

class ATextBtn extends StatelessWidget {
  const ATextBtn({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.button!
          .copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }
}
