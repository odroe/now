import '../formatter.dart';

/// Minute of the hour formatter, `[0...59]`.
class MinuteFormatter implements DateTimeFormatter {
  /// Creates a new [MinuteFormatter] instance.
  const MinuteFormatter();

  @override
  String format(DateTime date) => date.minute.toString();

  @override
  String get specifier => 'm';
}

/// Minute of the hour two digits formatter, `[00...59]`.
class MinuteTwoDigitsFormatter extends MinuteFormatter {
  /// Creates a new [MinuteTwoDigitsFormatter] instance.
  const MinuteTwoDigitsFormatter();

  @override
  String format(DateTime date) => super.format(date).padLeft(2, '0');

  @override
  String get specifier => 'mm';
}
