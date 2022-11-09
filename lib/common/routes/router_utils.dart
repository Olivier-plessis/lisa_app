enum AppPage { splash, auth, home, favorite, reading, profile, search }

extension AppPageExtension on AppPage {
  String get routePath {
    switch (this) {
      case AppPage.home:
        return '/';
      case AppPage.splash:
        return '/splash';
      case AppPage.auth:
        return '/sign';
      case AppPage.favorite:
        return '/favorite';
      case AppPage.search:
        return '/search';
      case AppPage.reading:
        return '/reading';
      case AppPage.profile:
        return '/profile';

      default:
        return '/';
    }
  }

  String get routeName {
    switch (this) {
      case AppPage.home:
        return 'HOME';

      case AppPage.splash:
        return 'SPLASH';

      case AppPage.auth:
        return 'AUTH';

      case AppPage.favorite:
        return 'FAVORITE';

      case AppPage.search:
        return 'SEARCH';

      case AppPage.reading:
        return 'READING';

      case AppPage.profile:
        return 'PROFILE';

      default:
        return 'HOME';
    }
  }

// for page titles to use on appbar
  String get routePageTitle {
    switch (this) {
      case AppPage.home:
        return 'Lisa';

      default:
        return 'Lisa';
    }
  }
}
