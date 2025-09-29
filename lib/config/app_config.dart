// lib/config/app_config.dart

enum Environment {
  dev,
  staging,
  prod,
}

class AppConfig {
  final Environment environment;
  final String appName;
  final String apiBaseUrl;
  final String apiKey;

  final bool showDebugBanner;

  AppConfig._internal({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
    required this.apiKey,
    required this.showDebugBanner,
  });

  static AppConfig? _instance;

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception('AppConfig must be initialized before use');
    }
    return _instance!;
  }

  static void initialize(Environment environment) {
    _instance = AppConfig._forEnvironment(environment);
  }

  factory AppConfig._forEnvironment(Environment environment) {
    switch (environment) {
      case Environment.dev:
        return AppConfig._internal(
          environment: Environment.dev,
          appName: 'MyApp Dev',
          apiBaseUrl: 'https://dev-api.company.com',
          apiKey: 'dev_key_xxx',
          showDebugBanner: true,
        );

      case Environment.staging:
        return AppConfig._internal(
          environment: Environment.staging,
          appName: 'MyApp Staging',
          apiBaseUrl: 'https://staging-api.company.com',
          apiKey: 'staging_key_xxx',
          showDebugBanner: true,
        );

      case Environment.prod:
        return AppConfig._internal(
          environment: Environment.prod,
          appName: 'MyApp',
          apiBaseUrl: 'https://api.company.com',
          apiKey: 'prod_key_xxx',
          showDebugBanner: false,
        );
    }
  }

  bool get isDevelopment => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.prod;
}
