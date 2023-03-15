import '../formatter.dart';

/// Full digits year formatter.
///
/// Example:
/// ```dart
/// final formatter = FullYearFormatter();
///
/// print(formatter.format(now())); // 2023
/// ```
class FullYearFormatter implements DateTimeFormatter {
  /// Creates a new [FullYearFormatter] instance.
  const FullYearFormatter();

  @override
  String format(DateTime date) => date.year.toString();

  @override
  String get specifier => 'YYYY';
}

/// Short digits year formatter.
///
/// Example:
/// ```dart
/// final formatter = ShortYearFormatter();
///
/// print(formatter.format(now())); // 23
/// ```
class ShortYearFormatter extends FullYearFormatter {
  /// Creates a new [ShortYearFormatter] instance.
  const ShortYearFormatter();

  @override
  String format(DateTime date) {
    return super
        .format(date)
        .runes
        .toList()
        .reversed
        .toList()
        .sublist(0, 2)
        .reversed
        .map((e) => String.fromCharCode(e))
        .join();
  }

  @override
  String get specifier => 'YY';
}
