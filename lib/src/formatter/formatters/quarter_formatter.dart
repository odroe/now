import '../formatter.dart';

/// Quarter of the year formatter, `[1...4]`.
class QuarterFormatter implements DateTimeFormatter {
  /// Creates a new [QuarterFormatter] instance.
  const QuarterFormatter();

  @override
  String format(DateTime date) => ((date.month - 1) ~/ 3 + 1).toString();

  @override
  String get specifier => 'Q';
}
