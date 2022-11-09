import 'package:app_ui/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/routes/router.dart';
import 'package:lisa_app/main/app_environment.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);

    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: EnvInfo.appName,
          builder: (
            BuildContext context,
            Widget? child,
          ) =>
              MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? const SizedBox.shrink(),
          ),
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: router,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
        );
      },
    );
  }
}
