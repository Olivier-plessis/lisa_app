import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lisa_app/main/app.dart';
import 'package:lisa_app/main/app_environment.dart';
import 'package:lisa_app/main/injection.dart';
import 'package:lisa_app/main/observers.dart';

class L10n {
  static const List<Locale> all = <Locale>[Locale('fr'), Locale('en')];
}

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  EnvInfo.initialize(environment);
  await configureDependencies(EnvInfo.envName);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  //await Firebase.initializeApp();

  runZonedGuarded<Future<void>>(
    () async {
      await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      runApp(EasyLocalization(
        supportedLocales: L10n.all,
        path: 'assets/translations',
        fallbackLocale: L10n.all[0],
        child: ProviderScope(
          observers: <ProviderObserver>[
            Observers(),
          ],
          child: const MainApp(),
        ),
      ));
    },
    (Object error, StackTrace stack) async {
      debugPrint('$error');
      debugPrint('$stack');
    },
  );
}
