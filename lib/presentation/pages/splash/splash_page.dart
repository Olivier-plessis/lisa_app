import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:lisa_app/main/app_environment.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.tertiaryColor,
      body: Center(
        child: ATextHeadlineOne(
          content: EnvInfo.appName,
        ),
      ),
    );
  }
}
