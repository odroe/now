import '../formatter.dart';

const Iterable<DateTimeFormatter> _defaultFormatters = [
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
  void registerWith(String specifier, DateTimeFormatter formatter) =>
      registerWithFn(specifier, formatter.format);

  /// Register a [formatter] for current [Now]
  /// instance with the given [specifier].
  void registerWithFn(
          String specifier, String Function(DateTime date) formatter) =>
      register(_FunctionBasedDateTimeFormatter(specifier, formatter));

  /// Destroys a registered [DateTime] formatter with the given [test].
  void destroy(bool Function(DateTimeFormatter formatter) test);

  /// Destroys a registered [DateTime] formatter with the given [specifier].
  void destroyWith(String specifier) =>
      destroy((formatter) => formatter.specifier == specifier);

  /// Destroys all default [DateTime] formatters.
  void destroyDefault() => destroy((formatter) =>
      _defaultFormatters.any((f) => f.specifier == formatter.specifier));

  /// Destroys all registered [DateTime] formatters.
  void destroyAll() => destroy((_) => true);

  /// Constructs a [DateTime] instance with current date and time in the
  /// local time zone.
  DateTime call() => DateTime.now();

  /// Returns all registered [DateTimeFormatter]s.
  Iterable<DateTimeFormatter> get formatters;

  /// Returns a forbidden specifier.
  final String forbiddenSpecifier = String.fromCharCode(0x0200B);

  /// Returns default [DateTimeFormatter]s.
  Iterable<DateTimeFormatter> get defaultFormatters => _defaultFormatters;

  /// Satrts a new [Stopwatch] and returns it.
  ///
  /// If [start] is `true` (default) the [Stopwatch] is started immediately.
  Stopwatch stopwatch([bool start = true]) {
    final stopwatch = Stopwatch();
    if (start) {
      stopwatch.start();
    }

    return stopwatch;
  }
}

/// Creates a new [Now] instance.
final Now now = _NowImpl();

/// Internal [Now] implementation.
class _NowImpl extends Now {
  /// Formatters.
  @override
  final List<DateTimeFormatter> formatters = _defaultFormatters.toList();

  @override
  void destroy(bool Function(DateTimeFormatter formatter) test) =>
      formatters.removeWhere(test);

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
