import 'package:atomic_ui/atoms/button/app_button.dart';
import 'package:atomic_ui/atoms/text/button.dart';

import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  const MButton({
    Key? key,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  final String content;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AButton.destructive(
      theme: Theme.of(context),
      onPressed: onPressed,
      child: ATextBtn(
        content: content,
      ),
    );
  }
}
