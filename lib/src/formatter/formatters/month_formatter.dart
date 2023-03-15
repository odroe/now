import '../formatter.dart';

/// Month between `[1...12]` formatter.
class MonthFormatter implements DateTimeFormatter {
  /// Creates a new [MonthFormatter] instance.
  const MonthFormatter();

  @override
  String format(DateTime date) => date.month.toString();

  @override
  String get specifier => 'M';
}

/// Month between `[01...12]` formatter.
class MonthTwoDigitsFormatter extends MonthFormatter {
  /// Creates a new [MonthTwoDigitsFormatter] instance.
  const MonthTwoDigitsFormatter();

  @override
  String format(DateTime date) => super.format(date).padLeft(2, '0');

  @override
  String get specifier => 'MM';
}

/// Month full name formatter.
///
/// Example:
/// ```dart
/// final formatter = MonthFullFormatter();
/// print(formatter.format(now())); // December
/// ```
class MonthFullFormatter implements DateTimeFormatter {
  /// Full month names.
  static const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Creates a new [MonthFullFormatter] instance.
  const MonthFullFormatter();

  @override
  String format(DateTime date) => months.elementAt(date.month - 1);

  @override
  String get specifier => 'MMMM';
}

/// Month abbreviated name formatter.
///
/// Example:
/// ```dart
/// final formatter = MonthAbbreviatedFormatter();
/// print(formatter.format(now())); // Dec
/// ```
class MonthAbbreviatedFormatter extends MonthFullFormatter {
  /// Creates a new [MonthAbbreviatedFormatter] instance.
  const MonthAbbreviatedFormatter();

  @override
  String format(DateTime date) => super.format(date).substring(0, 3);

  @override
  String get specifier => 'MMM';
}
