import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MainScaffoldScreen extends StatelessWidget {
  const MainScaffoldScreen({
    super.key,
    required this.child,
    this.backgroundColor = ColorTheme.tertiaryColor,
  });

  final Widget child;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: child,
      ),
    );
  }
}
