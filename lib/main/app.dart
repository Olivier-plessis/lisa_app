import 'package:flutter/material.dart';

import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/domain/providers/providers.dart';
import 'package:lisa_app/common/domain/state/settings/settings_details.dart';
import 'package:lisa_app/common/domain/state/settings/settings_state.dart';
import 'package:lisa_app/common/routes/router.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/common/utils/theme_mode.dart' as utils;

import 'package:lisa_app/main/app_environment.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);

    final SettingsState settings = ref.watch(lisaSettings);

    final ThemeMode themeMode = settings.maybeWhen(
        data: (SettingsDetails data) => utils.getThemeMode(data.themeMode),
        orElse: () => ThemeMode.light);

    ref.listen(initializationProvider, (_, Object? state) {});

    ref.listen<AuthState>(
      authNotifierProvider,
      (_, AuthState state) {
        state.maybeMap(
          orElse: () {},
          authenticating: (_) {
            router.goNamed(AppPage.splash.routeName);
          },
          authenticated: (_) {
            router.goNamed(AppPage.home.routeName);
          },
          unauthenticated: (_) {
            router.goNamed(AppPage.auth.routeName);
          },
          signedOut: (_) => router.goNamed(AppPage.auth.routeName),
        );
      },
    );

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
          themeMode: themeMode,
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
