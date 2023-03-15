import '../formatter.dart';

/// Second of the minute formatter, `[0...59]`.
class SecondFormatter implements DateTimeFormatter {
  /// Creates a new [SecondFormatter] instance.
  const SecondFormatter();

  @override
  String format(DateTime date) => date.second.toString();

  @override
  String get specifier => 's';
}

/// Second of the two digits formatter, `[00...59]`.
class SecondTwoDigitsFormatter extends SecondFormatter {
  /// Creates a new [SecondTwoDigitsFormatter] instance.
  const SecondTwoDigitsFormatter();

  @override
  String format(DateTime date) => super.format(date).padLeft(2, '0');

  @override
  String get specifier => 'ss';
}
