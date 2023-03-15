/// Extension on [int] to add methods to convert to [Duration].
///
/// ## Supported units
/// - `microseconds`
/// - `milliseconds`
/// - `seconds`
/// - `minutes`
/// - `hours`
/// - `days`
/// - `weeks`
extension IntConvertDuration on int {
  /// Returns a [Duration] with the given number of microseconds.
  Duration get microseconds => Duration(microseconds: this);

  /// Returns a [Duration] with the given number of milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns a [Duration] with the given number of seconds.
  Duration get seconds => Duration(seconds: this);

  /// Returns a [Duration] with the given number of minutes.
  Duration get minutes => Duration(minutes: this);

  /// Returns a [Duration] with the given number of hours.
  Duration get hours => Duration(hours: this);

  /// Returns a [Duration] with the given number of days.
  Duration get days => Duration(days: this);

  /// Returns a [Duration] with the given number of weeks.
  Duration get weeks =>
      Duration(microseconds: this * DurationWeeks.microsecondsPerWeek);
}

/// Extension on [Duration] to add methods to enters weeks.
extension DurationWeeks on Duration {
  /// The number of day per week.
  static const int daysPerWeek = 7;

  /// The number of microseconds per week.
  static const int microsecondsPerWeek =
      Duration.microsecondsPerDay * daysPerWeek;

  /// The number of entire weeks spanned by this [Duration].
  ///
  /// For example, a duration of four weeks and three hours
  /// has four entire weeks.
  /// ```dart
  /// const duration = Duration(days: 4, hours: 3);
  /// print(duration.inWeeks); // 1
  /// ```
  int get inWeeks => inMicroseconds ~/ microsecondsPerWeek;
}
