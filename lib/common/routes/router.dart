import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/presentation/pages/home/home.dart';
import 'package:lisa_app/presentation/pages/sing/sing.dart';
import 'package:lisa_app/presentation/pages/splash/splash.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(
    Stream<dynamic> stream,
  ) {
    notifyListeners();
    _subscription = stream.listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final Provider<GoRouter> routerProvider =
    Provider<GoRouter>((ProviderRef<GoRouter> ref) {
  final RouterNotifier router = RouterNotifier(ref);
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: router._routes,
    initialLocation: '/sign',
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref);

  final Ref _ref;

  List<GoRoute> get _routes => <GoRoute>[
        GoRoute(
          path: '/splash',
          pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          name: 'sign',
          path: '/sign',
          pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SignPage(),
          ),
        ),
        GoRoute(
          path: '/',
          pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const HomePage(),
          ),
        ),
      ];
}
