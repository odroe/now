import '../formatter.dart';

/// Millisecond of the second formatter, `[0...999]`.
class MillisecondFormatter implements DateTimeFormatter {
  /// Creates a new [MillisecondFormatter] instance.
  const MillisecondFormatter();

  @override
  String format(DateTime date) => date.millisecond.toString();

  @override
  String get specifier => 'SSS';
}
