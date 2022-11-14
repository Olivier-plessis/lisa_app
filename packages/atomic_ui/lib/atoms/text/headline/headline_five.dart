import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextHeadlineFive extends StatelessWidget {
  const ATextHeadlineFive({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.headline5!.copyWith(color: ColorTheme.secondaryColor),
    );
  }
}
