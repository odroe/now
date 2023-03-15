import '../formatter.dart';

/// Hour of the day formatter, `[0...23]`.
class HourOfDayFormatter implements DateTimeFormatter {
  /// Creates a new [HourOfDayFormatter] instance.
  const HourOfDayFormatter();

  @override
  String format(DateTime date) => date.hour.toString();

  @override
  String get specifier => 'H';
}

/// Hour of the two digits formatter, `[00...23]`.
class HourOfDayTwoDigitsFormatter extends HourOfDayFormatter {
  /// Creates a new [HourOfDayTwoDigitsFormatter] instance.
  const HourOfDayTwoDigitsFormatter();

  @override
  String format(DateTime date) => super.format(date).padLeft(2, '0');

  @override
  String get specifier => 'HH';
}

/// 12-hour clock hour of the day formatter, `[1...12]`.
class HourOfDay12Formatter implements DateTimeFormatter {
  /// Creates a new [HourOfDay12Formatter] instance.
  const HourOfDay12Formatter();

  @override
  String format(DateTime date) => (date.hour % 12).toString();

  @override
  String get specifier => 'h';
}

/// 12-hour clock hour of the two digits formatter, `[01...12]`.
class HourOfDay12TwoDigitsFormatter extends HourOfDay12Formatter {
  /// Creates a new [HourOfDay12TwoDigitsFormatter] instance.
  const HourOfDay12TwoDigitsFormatter();

  @override
  String format(DateTime date) => super.format(date).padLeft(2, '0');

  @override
  String get specifier => 'hh';
}
