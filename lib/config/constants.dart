/// Environment variables and shared app constants.
abstract class Constants {
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );
}
