import 'formatter.dart';

/// [DateTime] pattern token.
///
/// The [DateTimePatternTokenizer] class returns a list of tokens.
abstract class DateTimePatternToken {
  /// Format the given [date] and return the formatted string.
  String format(DateTime date);

  /// Create a new [DateTimePatternToken] instance from the given [String]
  const factory DateTimePatternToken.string(String value) =
      _StringDateTimePatternToken;

  /// Create a new [DateTimePatternToken] instance from the given [DateTimeFormatter]
  const factory DateTimePatternToken.formatter(DateTimeFormatter formatter) =
      _DateTimeFormatterDateTimePatternToken;

  /// Create a new [DateTimePatternToken] instance for removing.
  const factory DateTimePatternToken.remove() = _RemoveDateTimePatternToken;
}

/// String token.
class _StringDateTimePatternToken implements DateTimePatternToken {
  /// String value.
  final String value;

  /// Creates a new [_StringDateTimePatternToken] instance.
  const _StringDateTimePatternToken(this.value);

  @override
  String format(DateTime date) => value;

  @override
  String toString() => value;
}

/// [DateTimeFormatter] token.
class _DateTimeFormatterDateTimePatternToken implements DateTimePatternToken {
  /// Formatter.
  final DateTimeFormatter formatter;

  /// Creates a new [_DateTimeFormatterDateTimePatternToken] instance.
  const _DateTimeFormatterDateTimePatternToken(this.formatter);

  @override
  String format(DateTime date) => formatter.format(date);

  @override
  String toString() => 'formatter(${formatter.specifier})';
}

/// Remove token.
class _RemoveDateTimePatternToken implements DateTimePatternToken {
  /// Creates a new [_RemoveDateTimePatternToken] instance.
  const _RemoveDateTimePatternToken();

  @override
  String format(DateTime date) => '';

  @override
  String toString() => '';
}
