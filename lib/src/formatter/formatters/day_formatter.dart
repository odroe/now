import '../formatter.dart';

/// Day of the month formatter, `[1...31]`.
class DayOfMonthFormatter implements DateTimeFormatter {
  /// Creates a new [DayOfMonthFormatter] instance.
  const DayOfMonthFormatter();

  @override
  String format(DateTime date) => date.day.toString();

  @override
  String get specifier => 'D';
}

/// Day of the month formatter, `[01...31]`.
class DayOfMonthTwoDigitsFormatter extends DayOfMonthFormatter {
  /// Creates a new [DayOfMonthTwoDigitsFormatter] instance.
  const DayOfMonthTwoDigitsFormatter();

  @override
  String format(DateTime date) => super.format(date).padLeft(2, '0');

  @override
  String get specifier => 'DD';
}

/// Day of the week formatter, `[1...7]`.
class DayOfWeekFormatter implements DateTimeFormatter {
  /// Creates a new [DayOfWeekFormatter] instance.
  const DayOfWeekFormatter();

  @override
  String format(DateTime date) => date.weekday.toString();

  @override
  String get specifier => 'd';
}

/// Day of the week full name formatter.
class DayOfWeekFullFormatter implements DateTimeFormatter {
  /// Full day names.
  static const days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  /// Creates a new [DayOfWeekFullFormatter] instance.
  const DayOfWeekFullFormatter();

  @override
  String format(DateTime date) => days.elementAt(date.weekday - 1);

  @override
  String get specifier => 'dddd';
}

/// Day of the week Short name formatter.
class DayOfWeekShortFormatter extends DayOfWeekFullFormatter {
  /// Creates a new [DayOfWeekShortFormatter] instance.
  const DayOfWeekShortFormatter();

  @override
  String format(DateTime date) => super.format(date).substring(0, 3);

  @override
  String get specifier => 'ddd';
}

/// Day of the week min name formatter.
class DayOfWeekMinFormatter extends DayOfWeekFullFormatter {
  /// Creates a new [DayOfWeekMinFormatter] instance.
  const DayOfWeekMinFormatter();

  @override
  String format(DateTime date) => super.format(date).substring(0, 2);

  @override
  String get specifier => 'dd';
}
