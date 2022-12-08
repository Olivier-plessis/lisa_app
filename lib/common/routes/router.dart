import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/domain/models/book/items.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/pages/favorite/favorite_detail_page.dart';
import 'package:lisa_app/presentation/pages/favorite/favorite_page.dart';
import 'package:lisa_app/presentation/pages/home/home_page.dart';
import 'package:lisa_app/presentation/pages/profile/profile_page.dart';
import 'package:lisa_app/presentation/pages/reading/reading_detail_page.dart';
import 'package:lisa_app/presentation/pages/reading/reading_page.dart';
import 'package:lisa_app/presentation/pages/search/search_details_page.dart';
import 'package:lisa_app/presentation/pages/search/search_page.dart';
import 'package:lisa_app/presentation/pages/sign/sign_page.dart';
import 'package:lisa_app/presentation/pages/splash/splash_page.dart';
import 'package:lisa_app/presentation/scaffold/main_scaffold_screen.dart';
import 'package:lisa_app/presentation/scaffold/scaffold_with_navbar.dart';

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
  final RouterNotifier router = RouterNotifier();
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: router._routes,
    initialLocation: '/',
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier();

  List<RouteBase> get _routes => <RouteBase>[
        GoRoute(
          name: AppPage.search.routeName,
          path: AppPage.search.routePath,
          pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const MainScaffoldScreen(
              child: SearchPage(),
            ),
          ),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final String id = state.params['id']!;
                final Items? item = state.extra as Items?;
                return MaterialPage<dynamic>(
                  key: state.pageKey,
                  child: MainScaffoldScreen(
                    child: SearchDetailsPage(itemId: id, item: item),
                  ),
                );
              },
            )
          ],
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              name: AppPage.home.routeName,
              path: AppPage.home.routePath,
              pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const HomePage(),
              ),
            ),
            GoRoute(
              name: AppPage.favorite.routeName,
              path: AppPage.favorite.routePath,
              pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
                  key: state.pageKey,
                  child: const MainScaffoldScreen(
                    child: FavoritePage(),
                  )),
              routes: [
                GoRoute(
                  path: ':id',
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final String id = state.params['id']!;
                    final SingleBook? singleBook = state.extra as SingleBook?;
                    return MaterialPage<dynamic>(
                      key: state.pageKey,
                      child: MainScaffoldScreen(
                        child: FavoriteDetailsPage(
                            singleBookId: id, singleBook: singleBook),
                      ),
                    );
                  },
                )
              ],
            ),
            GoRoute(
              name: AppPage.reading.routeName,
              path: AppPage.reading.routePath,
              pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const MainScaffoldScreen(
                  child: ReadingPage(),
                ),
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final String id = state.params['id']!;
                    final SingleBook? book = state.extra as SingleBook?;
                    return MaterialPage<dynamic>(
                      key: state.pageKey,
                      child: MainScaffoldScreen(
                        child: ReadingDetailsPage(singleBookId: id, book: book),
                      ),
                    );
                  },
                )
              ],
            ),
            GoRoute(
              name: AppPage.profile.routeName,
              path: AppPage.profile.routePath,
              pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
        GoRoute(
          name: AppPage.splash.routeName,
          path: AppPage.splash.routePath,
          pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          name: AppPage.auth.routeName,
          path: AppPage.auth.routePath,
          pageBuilder: (_, GoRouterState state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SignPage(),
          ),
        ),
      ];
}
