// ignore_for_file: constant_identifier_names, use_setters_to_change_properties, avoid_classes_with_only_static_members
enum AppEnvironment { DEV, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const Map<AppEnvironment, String> _appTitles =
      <AppEnvironment, String>{
    AppEnvironment.DEV: 'Lisa Dev',
    AppEnvironment.PROD: 'Lisa',
  };

  static const Map<AppEnvironment, String> _connectionStrings =
      <AppEnvironment, String>{
    AppEnvironment.DEV: 'https://www.googleapis.com/books/v1/volumes',
    AppEnvironment.PROD: 'https://www.googleapis.com/books/v1/volumes',
  };

  static const Map<AppEnvironment, String> _envs = <AppEnvironment, String>{
    AppEnvironment.DEV: 'dev',
    AppEnvironment.PROD: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
