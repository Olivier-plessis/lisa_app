import 'package:flutter/material.dart';

class MainScaffoldScreen extends StatelessWidget {
  const MainScaffoldScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: child,
      ),
    );
  }
}
