import '../formatter.dart';

/// Upper cased AM/PM formatter.
///
/// ```dart
/// final formatter = AmpmUpperCaseFormatter();
///
/// print(formatter.format(now())); // AM or PM
/// ```
class AmpmUpperCaseFormatter implements DateTimeFormatter {
  /// Creates a new [AmpmUpperCaseFormatter] instance.
  const AmpmUpperCaseFormatter();

  @override
  String format(DateTime date) => date.hour < 12 ? 'AM' : 'PM';

  @override
  String get specifier => 'A';
}

/// Lower cased am/pm formatter.
///
/// ```dart
/// final formatter = AmpmLowerCaseFormatter();
///
/// print(formatter.format(now())); // am or pm
/// ```
class AmpmLowerCaseFormatter extends AmpmUpperCaseFormatter {
  /// Creates a new [AmpmLowerCaseFormatter] instance.
  const AmpmLowerCaseFormatter();

  @override
  String format(DateTime date) => super.format(date).toLowerCase();

  @override
  String get specifier => 'a';
}
