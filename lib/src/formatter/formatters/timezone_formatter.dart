
import '../formatter.dart';

/// Time zone offset from UTC formatter, `±HH:mm`.
class TimeZoneOffsetFormatter implements DateTimeFormatter {
  /// Creates a new [TimeZoneOffsetFormatter] instance.
  const TimeZoneOffsetFormatter();

  @override
  String format(DateTime date) {
    final offset = date.timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = offset.inMinutes.abs().toString().padLeft(2, '0');
    return '$sign$hours:$minutes';
  }

  @override
  String get specifier => 'Z';
}

/// Time zone offset from UTC formatter, `±HHmm`.
class TimeZoneOffsetShortFormatter extends TimeZoneOffsetFormatter {
  /// Creates a new [TimeZoneOffsetShortFormatter] instance.
  const TimeZoneOffsetShortFormatter();

  @override
  String format(DateTime date) => super.format(date).replaceAll(':', '');

  @override
  String get specifier => 'ZZ';
}
