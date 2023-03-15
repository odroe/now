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
extension IntConvertToDurationExtension on int {
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
  Duration get weeks => Duration(days: this * 7);
}
