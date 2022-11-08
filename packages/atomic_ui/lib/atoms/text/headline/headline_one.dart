import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextHeadlineOne extends StatelessWidget {
  const ATextHeadlineOne({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.headline1!.copyWith(color: ColorTheme.secondaryColor),
    );
  }
}
