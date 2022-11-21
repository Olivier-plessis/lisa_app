import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextHeadlineSix extends StatelessWidget {
  const ATextHeadlineSix({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.headline6!.copyWith(
          color: ColorTheme.orangeColor,
          fontSize: FontSizeTheme.bodyMedium.toDouble()),
    );
  }
}
