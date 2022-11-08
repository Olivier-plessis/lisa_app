import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextHeadlineTwo extends StatelessWidget {
  const ATextHeadlineTwo({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.headline2!.copyWith(color: ColorTheme.tertiaryColor),
    );
  }
}
