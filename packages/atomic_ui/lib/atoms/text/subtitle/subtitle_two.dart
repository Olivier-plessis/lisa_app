import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextSubTitleSecondary extends StatelessWidget {
  const ATextSubTitleSecondary({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.subtitle2!.copyWith(
          color: ColorTheme.orangeColor,
          fontSize: FontSizeTheme.bodyLight.toDouble()),
    );
  }
}
