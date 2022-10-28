import 'package:app_ui/app_ui.dart';
import 'package:atomic_widget/atomic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lisa_app/main/app_environment.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
