import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ATextBodyTwo extends StatelessWidget {
  const ATextBodyTwo({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      content,
      style: textTheme.bodyText2!.copyWith(color: ColorTheme.bodyTextColor),
    );
  }
}
