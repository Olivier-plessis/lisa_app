import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextUnderline extends StatelessWidget {
  const ATextUnderline({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.overline!.copyWith(
          color: ColorTheme.orangeColor,
          fontSize: FontSizeTheme.bodyLight.toDouble()),
    );
  }
}
