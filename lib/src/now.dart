import '../formatter.dart';

/// [DateTimeFormatter] exists exception.
class DateTimeFormatterExistsException implements Exception {
  /// [DateTimeFormatter] exists exception.
  const DateTimeFormatterExistsException(this.specifier);

  /// Specifier.
  final String specifier;

  @override
  String toString() => '$DateTimeFormatterExistsException: $specifier';
}

/// Now container.
abstract class Now {
  /// Register a [DateTimeFormatter] for current [Now] instance.
  void register(DateTimeFormatter formatter);

  /// Register a [DateTimeFormatter] for current [Now] instance with
  /// the given [specifier].
  void registerWith(String specifier, DateTimeFormatter formatter);

  /// Register a [formatter] for current [Now]
  /// instance with the given [specifier].
  void registerWithFn(
      String specifier, String Function(DateTime date) formatter);

  /// Destroys a registered [DateTime] formatter with the given [test].
  void destroy(bool Function(DateTimeFormatter formatter) test);

  /// Destroys a registered [DateTime] formatter with the given [specifier].
  void destroyWith(String specifier);

  /// Constructs a [DateTime] instance with current date and time in the
  /// local time zone.
  DateTime call();

  /// Returns all registered [DateTimeFormatter]s.
  Iterable<DateTimeFormatter> get formatters;

  /// Returns a forbidden specifier.
  final String forbiddenSpecifier = String.fromCharCode(0x0200B);

  /// Returns default [DateTimeFormatter]s.
  Iterable<DateTimeFormatter> get defaultFormatters => _defaultFormatters;

  /// Default [DateTimeFormatter]s.
  static const Iterable<DateTimeFormatter> _defaultFormatters = [
    AmpmUpperCaseFormatter(),
    AmpmLowerCaseFormatter(),
    DayOfMonthFormatter(),
    DayOfMonthTwoDigitsFormatter(),
    DayOfWeekFormatter(),
    DayOfWeekFullFormatter(),
    DayOfWeekShortFormatter(),
    DayOfWeekMinFormatter(),
    HourOfDayFormatter(),
    HourOfDayTwoDigitsFormatter(),
    HourOfDay12Formatter(),
    HourOfDay12TwoDigitsFormatter(),
    MillisecondFormatter(),
    MinuteFormatter(),
    MinuteTwoDigitsFormatter(),
    MonthFormatter(),
    MonthTwoDigitsFormatter(),
    MonthFullFormatter(),
    MonthAbbreviatedFormatter(),
    QuarterFormatter(),
    SecondFormatter(),
    SecondTwoDigitsFormatter(),
    TimeZoneOffsetFormatter(),
    TimeZoneOffsetShortFormatter(),
    FullYearFormatter(),
    ShortYearFormatter(),
  ];
}

/// Creates a new [Now] instance.
final Now now = _NowImpl();

/// Internal [Now] implementation.
class _NowImpl extends Now {
  /// Formatters.
  @override
  List<DateTimeFormatter> formatters = [...Now._defaultFormatters];

  @override
  DateTime call() => DateTime.now();

  @override
  void destroy(bool Function(DateTimeFormatter formatter) test) =>
      formatters.removeWhere(test);

  @override
  void destroyWith(String specifier) =>
      destroy((formatter) => formatter.specifier == specifier);

  @override
  void register(DateTimeFormatter formatter) {
    if (formatter.specifier == forbiddenSpecifier) {
      throw DateTimeFormatterExistsException(formatter.specifier);
    }

    if (formatters.any((f) => f.specifier == formatter.specifier)) {
      throw DateTimeFormatterExistsException(formatter.specifier);
    }

    formatters.add(formatter);
  }

  @override
  void registerWith(String specifier, DateTimeFormatter formatter) =>
      registerWithFn(specifier, formatter.format);

  @override
  void registerWithFn(
      String specifier, String Function(DateTime date) formatter) {
    register(_FunctionBasedDateTimeFormatter(specifier, formatter));
  }
}

/// Internal Function-based [DateTimeFormatter] implementation.
class _FunctionBasedDateTimeFormatter implements DateTimeFormatter {
  /// Internal Function-based [DateTimeFormatter] implementation.
  const _FunctionBasedDateTimeFormatter(this.specifier, this.fn);

  @override
  final String specifier;

  final String Function(DateTime date) fn;

  @override
  String format(DateTime date) => fn(date);
}
